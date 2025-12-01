import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';
import 'package:hello_world/common/widgets/primary_button.dart';
import 'package:hello_world/modules/login/view/login_form.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>()
          ),
          child: const LoginForm()
        )
      )
    );
  }

}
