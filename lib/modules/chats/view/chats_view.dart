import 'package:flutter/material.dart';
import 'package:hello_world/modules/chats/view/chats_header.dart';

import 'chats_list.dart';
import 'chats_search_bar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ChatsHeader(),
        ChatsSearchBar(),
        Expanded(child: ChatsList()),
      ],
    );
  }
}
