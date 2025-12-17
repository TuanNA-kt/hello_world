import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import 'contacts_list_item.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    final 
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
            final user = chats[index];

            return ContactsListItem(
              user: , status: null, onAddFriend: () {  }, onAcceptRequest: () {  }, onCancelRequest: () {  },
            );
          },
        ),
      ),
    );
  }

}