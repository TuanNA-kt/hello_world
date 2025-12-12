import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';

import '../../../../common/app_icon.dart';

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
              const Text(
                "Lưu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
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
