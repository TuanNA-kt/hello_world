import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:models/chat_room_display.dart';

class ChatsHeader extends StatelessWidget {
  const ChatsHeader({super.key});

  void _onPressed(BuildContext context) {
    context.pushNamed('createChatRoom');
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    "Tin nhắn",
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                  )
              ),
              InkWell(
                onTap: () {
                  _onPressed(context);
                },
                customBorder: const CircleBorder(),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                  child: Center(
                      child: SvgPicture.asset('assets/images/ic_add_chat.svg')
                  ),
                ),
              ),
            ],
          )
      );
  }
}
