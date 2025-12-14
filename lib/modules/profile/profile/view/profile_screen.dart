import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/profile/profile/view/profile_view.dart';

import 'package:user_repository/user_repository.dart';

import '../../../../di/injection.dart';
import '../../bloc/profile_cubit.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const ProfileView()
          ],
        ),
      ),
    );
  }
}