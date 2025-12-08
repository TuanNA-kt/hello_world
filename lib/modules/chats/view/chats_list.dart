import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:models/chat_room_display.dart';

import '../../../common/app_colors.dart';
import '../../../di/injection.dart';
import '../bloc/chats_bloc.dart';
import '../bloc/chats_state.dart';
import 'chat_list_item.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  void _onChatItemClick(ChatRoomDisplay chatRoom, BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (BuildContext context, ChatsState state) {
        if (state.status == ChatsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == ChatsStatus.failure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        }

        final chats = state.isSearching
            ? state.filteredChatRooms
            : state.chatRooms;

        if (state.isSearching && chats.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/ic_search_empty.svg',
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  "Khong tim thay ket qua phu hop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }

        return Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (_, _) => const Divider(indent: 80),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];

                  return ChatListItem(
                    chatRoomDisplay: chat,
                    onClick: _onChatItemClick
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
