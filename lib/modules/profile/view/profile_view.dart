import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';
import 'package:hello_world/modules/profile/view/profile_card.dart';
import 'package:hello_world/modules/profile/view/profile_header_image.dart';
import 'package:user_repository/user_repository.dart';

import '../../../common/widgets/app_inside_background.dart';
import '../../../di/injection.dart';
import '../bloc/profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    final size = MediaQuery.of(context).size;
    final headerHeight = size.height * 2.0 / 3.0;
    cubit.updateUserProfile();
    return Stack(
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
            return ProfileHeaderImage(
              height: headerHeight,
              avatarUrl: state.user.avatarUrl,
            );
          },
          buildWhen: (previous, current) {
            return previous.user.avatarUrl != current.user.avatarUrl;
          },
        ),
        Column(children: [Spacer(),ProfileCard()]),
      ],
    );
  }
}
