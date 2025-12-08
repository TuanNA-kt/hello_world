import 'package:flutter/material.dart';
import 'package:hello_world/modules/chats/view/chats_header.dart';

import '../../chats/view/chats_search_bar.dart';
import 'friend_list.dart';


class CreateChatView extends StatelessWidget {
  const CreateChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ChatsHeader(),
        ChatsSearchBar(),
        Expanded(child: F),
      ],
    );
  }
}
