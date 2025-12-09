import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/widgets/app_background.dart';
import 'package:hello_world/modules/chats/bloc/chats_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../common/widgets/app_inside_background.dart';
import '../../../di/injection.dart';
import 'new_chat_view.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppInsideBackground(),
            BlocProvider(
              create: (BuildContext context) => ChatsBloc(
                chatRepository: sl<ChatRepository>(),
                currentUserId: context.read<UserRepository>().currentUser.id,
              ),
              child: const CreateChatView(),
            ),
          ],
        ),
      ),
    );
  }
}
