import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              SvgPicture.asset('assets/images/ic_mail_paper_plane.svg'),
              Text('Trai nghiem Awesome chat', style: TextStyle(fontSize: 26)),
              Text('Dang nhap', style: TextStyle(fontSize: 32)),
              SizedBox(height: 30),
              CustomTextField(key: UniqueKey(),
                hint: 'yourname@gmail.com',
                iconPath: 'assets/images/facebook.svg',
                label: 'EMAIL',
                type: TextFieldType.mail),
              SizedBox(height: 20),
              CustomTextField(key: UniqueKey(),
                  hint: '*******',
                  iconPath: 'assets/images/facebook.svg',
                  label: 'MAT KHAU',
                  type: TextFieldType.password)
            ],
          ),
        ),
      ),
    );
  }
}
