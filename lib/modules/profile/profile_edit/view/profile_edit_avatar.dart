import 'dart:io';

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
              final String? tempLocalPath = state.temporaryAvatarUrl?.value;
              final String? networkUrl = state.user.avatarUrl;

              final bool hasLocalImage = tempLocalPath != null && tempLocalPath.isNotEmpty;
              final bool hasNetworkImage = networkUrl != null && networkUrl.isNotEmpty;
              ImageProvider? imageProvider;

              if (hasLocalImage) {
                // Ưu tiên 1: Sử dụng ảnh tạm thời cục bộ (chưa upload)
                // Dùng FileImage để đọc đường dẫn file cục bộ
                imageProvider = FileImage(File(tempLocalPath));

              } else if (hasNetworkImage) {
                // Ưu tiên 2: Sử dụng ảnh đã lưu trên Cloud
                // Dùng NetworkImage để tải ảnh qua mạng
                imageProvider = NetworkImage(networkUrl);

              } else {
                // Ưu tiên 3: Dùng ảnh mặc định (Asset/SVG)
                // Nếu bạn dùng SVG cho default avatar, bạn không thể dùng nó làm CircleAvatar.backgroundImage
                // Nếu ảnh default là PNG/JPG trong assets, dùng AssetImage:
                imageProvider = NetworkImage(AppConst.defaultAvatarUrl);
              }

              return CircleAvatar(backgroundImage: imageProvider);
                  // backgroundImage:
                  // (state.temporaryAvatarUrl != null &&
                  //     state.temporaryAvatarUrl!.isNotEmpty)
                  //     ? NetworkImage(state.temporaryAvatarUrl!)
                  //     : NetworkImage(AppConst.defaultAvatarUrl));
            },
          ),
        ),

        // Camera badge button
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () async {await context.read<ProfileCubit>().onAvatarPicked();},
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
