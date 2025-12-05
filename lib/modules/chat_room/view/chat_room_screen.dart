import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  final String _chatRoomId;
  const ChatRoomScreen({required String chatRoomId}) : _chatRoomId = chatRoomId;

  @override
  Widget build(BuildContext context) {
    return Text("ChatRoomID: $_chatRoomId");
  }

}