
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';
import 'package:hello_world/modules/profile/view/profile_card.dart';
import 'package:hello_world/modules/profile/view/profile_header_image.dart';
import 'package:user_repository/user_repository.dart';

import '../../../common/widgets/app_inside_background.dart';
import '../../../di/injection.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    final user = cubit.currentUser;
    final size = MediaQuery.of(context).size;
    final headerHeight = size.height * 2.0 / 3.0;

    return Stack(
      children: [
        ProfileHeaderImage(height: headerHeight, avatarUrl: user.avatarUrl ?? AppConst.defaultAvatarUrl),
        Positioned(
          top: headerHeight - 120,
          left: 0,
          right: 0,
          child: const ProfileCard(),
        ),
      ],
    );
  }
}