import 'package:flutter/material.dart';
import 'package:hello_world/common/widgets/app_inside_background.dart';
import 'package:hello_world/common/widgets/app_inside_header.dart';

import '../../../common/app_icon.dart';

class ContactsView extends StatelessWidget{
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInsideHeader(header: 'Ban be', addIconPath: AppIcon.iconNewFriend, onAddPressed: () {  },),
        SearchBar(),
        const Expanded(child: ContactsList())
      ],
    );
  }

}