import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_world/modules/new_chat/bloc/new_chat_cubit.dart';
import 'package:hello_world/modules/new_chat/bloc/new_chat_state.dart';
import 'package:hello_world/modules/new_chat/view/friend_list_item.dart';
import 'package:models/chat_room_display.dart';

import '../../../common/app_colors.dart';
import '../../../di/injection.dart';

class FriendList extends StatelessWidget {
  const FriendList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewChatCubit, NewChatState>(
      builder: (BuildContext context, NewChatState state) {
        if (state.status == NewChatStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == NewChatStatus.failure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        }

        final users = state.isSearching
            ? state.filteredFriendList
            : state.friendList;

        if (state.isSearching && users.isEmpty) {
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

        return Padding(
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return FriendListItem(
                      user: user,
                      isSelected: state.isUserSelected(user),
                      onClick: () => context.read<NewChatCubit>().toggleUserSelection(user)
                  );
                },
              ),
            ),
          );
      },
    );
  }
}
