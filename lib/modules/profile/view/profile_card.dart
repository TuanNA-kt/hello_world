import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:hello_world/modules/profile/bloc/profile_cubit.dart';
import 'profile_option_tile.dart';
import 'profile_option_tile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info Row
          Row(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  AppConst.defaultAvatarUrl,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Awesome chat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "awesomechat@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.edit, size: 20),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(height: 1),

          // Options
          const ProfileOptionTile(
            icon: Icons.language,
            title: "Ngôn ngữ",
            trailing: Text("Tiếng Việt"),
          ),
          const ProfileOptionTile(
            icon: Icons.notifications,
            title: "Thông báo",
            showArrow: true,
          ),
          const ProfileOptionTile(
            icon: Icons.info_outline,
            title: "Phiên bản ứng dụng",
            trailing: Text("1.0.0"),
          ),

          const Divider(height: 1),
          const SizedBox(height: 10),

          // Logout
          GestureDetector(
            onTap: () async {await context.read<ProfileCubit>().logOut();},
            child: const Row(
              children: [
                Icon(Icons.logout, color: Colors.red),
                SizedBox(width: 10),
                Text(
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
}
