import 'package:flutter/material.dart';
import 'package:hello_world/modules/profile/profile_edit/view/profile_edit_header.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const ProfileEditHeader(),
        const SizedBox(height: 58),
        const ProfileEditCard(),
      ],
    );
  }

}