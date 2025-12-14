import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';
import 'package:hello_world/modules/profile/profile_edit/view/profile_edit_avatar.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_icon.dart';
import '../../bloc/profile_cubit.dart';
import '../../bloc/profile_state.dart';

class ProfileEditCard extends StatelessWidget {
  const ProfileEditCard({super.key});

  @override
  Widget build(BuildContext context) {
    print("From edit screen: context.read<ProfileCubit>().state.user.toString()");
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 42),
            ProfileEditAvatar(),
            const SizedBox(height: 62),
            const _FullnameFormField(),
            SizedBox(height: 30),
            const _PhoneNumberFormField(),
            SizedBox(height: 30),
            _BirthDayFormField()
          ],
        ),
      ),
    );
  }
}

class _FullnameFormField extends StatelessWidget {
  const _FullnameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select((ProfileCubit cubit) => cubit.state.fullNameForm.displayError);

    return CustomTextField(
      label: "HỌ VÀ TÊN",
      hint: 'Nguyen Van A',
      iconPath: AppIcon.iconPerson,
      initialText: context.read<ProfileCubit>().state.user.name,
      errorText: displayError != null ? "Invalid Name" : null,
      onChanged: (value) {
        context.read<ProfileCubit>().onFullNameChanged(value);
      },
      type: TextFieldType.name,
    );
  }

}

class _PhoneNumberFormField extends StatelessWidget {
  const _PhoneNumberFormField({super.key});
  @override
  Widget build(BuildContext context) {
    final displayError = context.select((ProfileCubit cubit) => cubit.state.phoneNumberForm.displayError);

    return CustomTextField(
      label: "SỐ ĐIỆN THOẠI",
      hint: '0123456789',
      iconPath: AppIcon.iconPhone,
      initialText: context.read<ProfileCubit>().state.user.phoneNumber,
      errorText: displayError != null ? "Invalid Phone Number" : null,
      onChanged: (value) {
        context.read<ProfileCubit>().onPhoneNumberChanged(value);
      },
      type: TextFieldType.phone,
    );
  }
}

class _BirthDayFormField extends StatelessWidget {
  const _BirthDayFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return CustomTextField(
          label: 'NGÀY SINH',
          hint: 'dd/MM/yyyy',
          iconPath: AppIcon.iconBirthDayCake,
          type: TextFieldType.birthday,
          initialDate: state.user.birthday != null
              ? DateTime.fromMicrosecondsSinceEpoch(state.user.birthday!)
              : null
          ,
          onDateChanged: (date) {
            context.read<ProfileCubit>().onBirthdayChanged(date);
          },
        );
      },
    );
  }


}


