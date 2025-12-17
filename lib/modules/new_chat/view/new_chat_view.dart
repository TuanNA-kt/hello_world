import 'package:flutter/material.dart';
import 'package:hello_world/modules/chats/view/chats_header.dart';
import 'package:hello_world/modules/new_chat/view/new_chat_screen.dart';

import '../../../common/widgets/app_search_bar.dart';
import '../../chats/view/chats_search_bar.dart';
import 'friend_list.dart';


class CreateChatView extends StatelessWidget {
  const CreateChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChatsHeader(),
        AppSearchBar(onChanged: (String p1) {}, hintText: 'Tim kiem ban be',),
        const Expanded(
          child: FriendList(),
        )
      ],
    );
  }
}
