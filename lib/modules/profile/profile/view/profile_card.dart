import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:hello_world/modules/auth/bloc/authentication_bloc.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';
import '../../bloc/profile_state.dart';
import 'profile_option_tile.dart';
import 'profile_option_tile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info Row
          Row(
            children: [
              Container(
                width: 63,
                height: 63,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryBlue, AppColors.lightBlue],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withValues(alpha: 30),
                      blurRadius: 15,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(3),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (BuildContext context, ProfileState state) {
                    return CircleAvatar(
                      backgroundImage:
                          (state.user.avatarUrl != null &&
                              state.user.avatarUrl!.isNotEmpty)
                          ? NetworkImage(state.user.avatarUrl!)
                          : NetworkImage(AppConst.defaultAvatarUrl),

                      // If null/empty, use the 'child' widget below
                      // child:
                      //     (state.user.avatarUrl == null ||
                      //         state.user.avatarUrl!.isEmpty)
                      //     ? Image.asset(
                      //         'assets/images/ic_default_avatar.png',
                      //         fit: BoxFit.fill,
                      //       )
                      //     : null,
                    );
                  },
                  buildWhen: (previous, current) {
                    return previous.user.avatarUrl != current.user.avatarUrl;
                  },
                ),
              ),

              const SizedBox(width: 15),
              Expanded(
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (BuildContext context, ProfileState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          state.user.email ?? "",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    );
                  },
                  buildWhen: (previous, current) {
                    return (previous.user.name != current.user.name) ||
                        (previous.user.email != current.user.email);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  onEditPressed(context);
                },
                icon: SvgPicture.asset("assets/images/ic_edit.svg"),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(height: 5, color: AppColors.lightGray),

          // Options
          ProfileOptionTile(
            assetName: "assets/images/ic_languages.svg",
            title: "Ngôn ngữ",
            trailing: Text("Tiếng Việt"),
            showArrow: true,
            onTap: () {},
          ),
          ProfileOptionTile(
            assetName: "assets/images/ic_notification.svg",
            title: "Thông báo",
            showArrow: true,
            onTap: () {},
          ),
          ProfileOptionTile(
            assetName: "assets/images/ic_app_version.svg",
            title: "Phiên bản ứng dụng",
            trailing: const Text("1.0.0"),
            onTap: () {},
          ),

          const Divider(height: 5, color: AppColors.lightGray),
          const SizedBox(height: 10),

          // Logout
          GestureDetector(
            onTap: () {
              context.read<AuthenticationBloc>().add(
                AuthenticationLogoutPressed(),
              );
            },
            child: Row(
              children: [
                SvgPicture.asset("assets/images/ic_log_out.svg"),
                const SizedBox(width: 10),
                const Text(
                  "Đăng xuất",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onEditPressed(BuildContext context) {
    context.read<ProfileCubit>().resetValidationAndRemoveTempedState();
    context.pushNamed('profileEdit');
  }
}
