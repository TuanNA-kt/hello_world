import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_const.dart';
import '../../../../common/app_icon.dart';
import '../../bloc/profile_cubit.dart';
import '../../bloc/profile_state.dart';

class ProfileEditAvatar extends StatelessWidget {
  const ProfileEditAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 143,
          height: 143,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
              return CircleAvatar(
                  backgroundImage:
                  (state.user.avatarUrl != null &&
                      state.user.avatarUrl!.isNotEmpty)
                      ? NetworkImage(state.user.avatarUrl!)
                      : NetworkImage(AppConst.defaultAvatarUrl));
            },
          ),
        ),

        // Camera badge button
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
             child: SvgPicture.asset(AppIcon.iconCamera, fit: BoxFit.scaleDown)
            ),
          ),
        ),
      ],
    );
  }
}
