import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/auth/login_screen.dart';
import 'modules/splash/splash_screen.dart';

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
        routes: <RouteBase>[
          GoRoute(path: '/', builder: (_, _) => const SplashScreen(),
            routes: <RouteBase>[
              GoRoute(path: 'login', builder: (_, _) => const LoginScreen())
            ],
          ),
        ],

        redirect: (context, state) {
          final authState = authBloc.state.status;

          switch(authState) {
            case AuthenticationStatus.unknown:
              return '/';
            case AuthenticationStatus.authenticated:
              return '/home';
            case AuthenticationStatus.unauthenticated:
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
