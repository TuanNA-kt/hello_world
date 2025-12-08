
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.pushNamed('chats');
              break;
            case 1:
              context.pushNamed('contact');
              break;
            case 2:
              context.pushNamed('profile');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/ic_chat_enable'),
            label: "Tin nhắn",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/ic_friends_disable'),
            label: "Bạn bè",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/ic_profile_disable'),
            label: "Trang cá nhân",
          ),
        ],
      ),
    );
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/contacts')) return 1;
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

}
