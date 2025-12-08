import 'package:flutter/material.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:models/chat_room_display.dart';

class ChatListItem extends StatelessWidget {
  final ChatRoomDisplay chatRoomDisplay;
  final void onClick;

  const ChatListItem({
    super.key,
    required this.chatRoomDisplay, required this.onClick,
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
            NetworkImage(chatRoomDisplay.avatarUrl),
          ),
          if (chatRoomDisplay.unreadCount > 0)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chatRoomDisplay.unreadCount.toString(),
                  style: const TextStyle(
                      fontSize: 10, color: Colors.white),
                ),
              ),
            )
        ],
      ),
      title: Text(chatRoomDisplay.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(chatRoomDisplay.lastMessageText, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(
        chatRoomDisplay.updatedAt.toString(),
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }
}
