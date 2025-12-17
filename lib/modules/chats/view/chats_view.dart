import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/widgets/app_inside_header.dart';
import 'package:hello_world/modules/chats/view/chats_header.dart';

import '../../../common/app_icon.dart';
import '../../../common/widgets/app_search_bar.dart';
import 'chats_list.dart';
import 'chats_search_bar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInsideHeader(header: "Tin nhan", addIconPath: AppIcon.iconNewChat, onAddPressed: () {
          context.pushNamed('newChat');
        }),
        AppSearchBar(onChanged: (p1) {  }, hintText: 'Tim kiem tin nhan'),
        const Expanded(child: ChatsList()),
      ],
    );
  }
}
