import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/widgets/app_background.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';

import '../../bloc/profile_state.dart';


class ProfileHeaderImage extends StatelessWidget {
  final double height;
  final String? avatarUrl;

  const ProfileHeaderImage({
    super.key,
    required this.height,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
          final avatarUrl = state.user.avatarUrl;
          if(avatarUrl != null && avatarUrl.isNotEmpty) {
            return Image.network(avatarUrl);
          } else {
            return AppBackground();
          }
        },
      ),
    );
  }
}
