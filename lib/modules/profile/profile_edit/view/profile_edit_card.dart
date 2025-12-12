import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';
import 'package:hello_world/modules/profile/profile_edit/view/profile_edit_avatar.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_icon.dart';
import '../../bloc/profile_cubit.dart';

class ProfileEditCard extends StatelessWidget {
  const ProfileEditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 42),
          ProfileEditAvatar(),
          const SizedBox(height: 42),
          CustomTextField(
            label: "Ho va Ten",
            hint: 'Nguyen Van A',
            iconPath: AppIcon.iconPerson,
            errorText: 'Invalid Name',
            onChanged: () { context.read<ProfileCubit>() },
            type: TextFieldType.phone,
          ),
        ],
      ),
    );
  }

}
