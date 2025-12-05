import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/modules/chats/view/chats_screen.dart';
import 'package:hello_world/modules/contacts/view/contacts_screen.dart';
import 'package:hello_world/modules/profile/view/profile_screen.dart';
import 'package:user_repository/user_repository.dart';

import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/chat_room/view/chat_room_screen.dart';
import 'modules/login/view/login_screen.dart';
import 'modules/register/view/register_screen.dart';
import 'modules/splash/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthenticationRepository(), dispose: (repo) => repo.dispose()),
          RepositoryProvider(create: (_) => UserRepository())
        ],
        child: BlocProvider(
          create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
            userRepository: context.read<UserRepository>()
          )..add(AuthenticationSubscriptionRequested()),
          child: const AppView(),
        )
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppViewState();
  }
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    final GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (_, _) => const SplashScreen(),

          routes: <RouteBase>[
            GoRoute(
              path: 'login',
              name: 'login',
              builder: (_, _) => const LoginScreen(),
            ),

            GoRoute(
              path: 'register',
              name: 'register',
              builder: (_, _) => const RegisterScreen(),
            ),

          ],
        ),
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return HomePage(child: child);
          },
          routes: [
            GoRoute(
              path: '/chats',
              name: 'chats',
              pageBuilder: (context, state) => NoTransitionPage(child: ChatsScreen(key: state.pageKey))
            ),
            GoRoute(
                path: '/contacts',
                name: 'contact',
                pageBuilder: (context, state) => NoTransitionPage(child: ContactsScreen(key: state.pageKey))
            ),
            GoRoute(
                path: '/profile',
                name: 'profile',
                pageBuilder: (context, state) => NoTransitionPage(child: ProfileScreen(key: state.pageKey))
            )
          ]
        ),
        GoRoute(
          path: '/chat/:chatRoomId',
          name: 'chatRoom',
          builder: (context, state) {
            final id = state.pathParameters['chatRoomId']!;
            return ChatRoomScreen(chatRoomId: id);
          }
        )
      ],

        redirect: (context, state) {
          final authStatus = authBloc.state.status;
          final String path = state.matchedLocation;
          final List<String> unauthenticatedRoutes = ['/login', '/register'];

          switch(authStatus) {
            case AuthenticationStatus.unknown:
              return '/';
            case AuthenticationStatus.authenticated:
              if (path.startsWith('/chats') ||
                  path.startsWith('/contacts') ||
                  path.startsWith('/profile') ||
                  path.startsWith('/chat/')) {
                return null;
              }
              return '/chats';
            case AuthenticationStatus.unauthenticated:
              if(unauthenticatedRoutes.contains(state.uri.toString())) return null;
              return '/login';

          }
        },
      refreshListenable: GoRouterRefreshStream(
        context.read<AuthenticationBloc>().stream,
      ),
    );

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

/// Makes a Stream into a Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
