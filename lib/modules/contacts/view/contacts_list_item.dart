import 'package:flutter/material.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:models/user.dart';

enum FriendshipStatus { none, friend, requestSent, requestReceived }

class ContactsListItem extends StatelessWidget {
  final User user;
  final FriendshipStatus status;

  final VoidCallback? onAddFriend;
  final VoidCallback? onAcceptRequest;
  final VoidCallback? onCancelRequest;

  const ContactsListItem({
    super.key,
    required this.user,
    required this.status,
    required this.onAddFriend,
    required this.onAcceptRequest,
    required this.onCancelRequest,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              user.avatarUrl ?? AppConst.defaultAvatarUrl,
            ),
          ),
        ],
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: _FriendshipAction(
        status: status,
        onAccept: onAcceptRequest,
        onAdd: onAddFriend,
        onCancel: onCancelRequest,
      ),
    );
  }
}

class _FriendshipAction extends StatelessWidget {
  const _FriendshipAction({
    required this.status,
    required this.onAdd,
    required this.onAccept,
    required this.onCancel,
  });

  final FriendshipStatus status;
  final VoidCallback? onAdd;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      FriendshipStatus.friend => const SizedBox.shrink(),

      FriendshipStatus.none => GestureDetector(
        onTap: onAdd,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            'Ket ban',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ),
      ),

      FriendshipStatus.requestReceived => GestureDetector(
        onTap: onAccept,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            'Dong y',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ),
      ),

      FriendshipStatus.requestSent => GestureDetector(
        onTap: onCancel,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            'Huy',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ),
    };
  }
}
