import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/widgets/app_inside_background.dart';

import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';
import 'package:hello_world/modules/profile/profile_edit/view/profile_edit_view.dart';
import 'package:user_repository/user_repository.dart';

import '../../../../di/injection.dart';


class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Stack(
          children: [
            const AppInsideBackground(),
            const ProfileEditView()
          ],
        ))
    );
  }

}