import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';

import '../../../../common/app_icon.dart';
import '../../bloc/profile_state.dart';

class ProfileEditHeader extends StatelessWidget {
  const ProfileEditHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 13.68,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(AppIcon.iconArrowBackWhite),
                  onPressed: () => context.pop(),
                ),
              ),
              const Spacer(),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (BuildContext context, ProfileState state) {
                  if (state.isLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return TextButton(
                      onPressed: state.isValid
                          ? () {
                              context.read<ProfileCubit>().saveNewUserProfile();
                            }
                          : null,
                      child: Text(
                        "Lưu",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: state.isValid ? AppColors.white : AppColors.gray,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Center(
            child: Text(
              "Chỉnh sửa thông tin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void onSaved() {}
