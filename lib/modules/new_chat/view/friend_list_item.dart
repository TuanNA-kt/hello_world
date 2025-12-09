import 'package:flutter/material.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:models/chat_room_display.dart';
import 'package:models/user.dart';


class FriendListItem extends StatelessWidget {
  final User user;
  final bool isSelected;
  final void Function() onClick;

  const FriendListItem({
    super.key,
    required this.user, required this.isSelected, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage:
            NetworkImage(user.avatarUrl ?? AppConst.defaultAvatarUrl),
          )
        ],
      ),
      title: Text(user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      trailing: isSelected
          ? CircleAvatar(
        radius: 12,
        backgroundColor: Colors.blue,
        child: Icon(Icons.check, size: 16, color: Colors.white),
      )
          : CircleAvatar(
        radius: 12,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
        ),
      ),
      onTap: onClick
    );
  }
}
