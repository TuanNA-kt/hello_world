import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/register/view/register_form.dart';

import '../bloc/register_bloc.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
                create: (BuildContext context) => RegisterBloc(
                    authenticationRepository: context.read<AuthenticationRepository>()
                ),
                child: const RegisterForm()
            )
        )
    );
  }

}
