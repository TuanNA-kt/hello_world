import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';
import 'package:hello_world/common/widgets/primary_button.dart';

import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text("Authentication Failure")),
            );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            SvgPicture.asset('assets/images/ic_mail_paper_plane.svg'),
            SizedBox(height: 3),
            Text('Trải nghiệm Awesome chat', style: TextStyle(fontSize: 26)),
            SizedBox(height: 11),
            Text(
              'Đăng nhập',
              style: TextStyle(
                fontSize: 32,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 61),
            _UsernameInput(),
            SizedBox(height: 20),
            _PasswordInput(),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Quên mật khẩu?',
                style: TextStyle(fontSize: 14, color: AppColors.primaryBlue),
              ),
            ),
            SizedBox(height: 47),
            _LoginButton(),
            SizedBox(height: 123),
            Align(alignment: Alignment.center, child: _registerFootage()),
          ],
        ),
      ),
    );
  }

  //   return Scaffold(
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         padding: const EdgeInsets.all(25),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const SizedBox(height: 70),
  //             SvgPicture.asset('assets/images/ic_mail_paper_plane.svg'),
  //             Text('Trải nghiệm Awesome chat', style: TextStyle(fontSize: 26)),
  //             Text(
  //               'Đăng nhập',
  //               style: TextStyle(
  //                 fontSize: 32,
  //                 color: AppColors.primaryBlue,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 30),
  //             _UsernameInput(),
  //             SizedBox(height: 20),
  //             _PasswordInput(),
  //             Align(
  //               alignment: Alignment.centerRight,
  //               child: Text(
  //                 'Quên mật khẩu?',
  //                 style: TextStyle(fontSize: 14, color: AppColors.primaryBlue),
  //               ),
  //             ),
  //             PrimaryButton(text: 'Đăng ký', onPressed: onPressed),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void onPressed() {}
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );

    final bloc = context.read<LoginBloc>();

    return CustomTextField(
      label: 'EMAIL',
      hint: 'yourname@gmail.com',
      iconPath: 'assets/images/ic_mail.svg',
      type: TextFieldType.mail,

      errorText: displayError != null ? 'Invalid Email' : null,

      onChanged: (username) {
        bloc.add(LoginUsernameChanged(username));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );

    final bloc = context.read<LoginBloc>();

    return CustomTextField(
      label: 'Password',
      hint: '********',
      iconPath: 'assets/images/ic_key.svg',
      type: TextFieldType.password,

      errorText: displayError != null ? 'Invalid Password' : null,

      onChanged: (password) {
        bloc.add(LoginPasswordChanged(password));
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isValid
            ? () => context.read<LoginBloc>().add(LoginSubmitted())
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          disabledBackgroundColor: AppColors.gray,
          minimumSize: const Size.fromHeight(52),
        ),
        child: const Text(
          "ĐĂNG NHẬP",
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}

class _registerFootage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // 1. STYLE CHUNG CHO CẢ DÒNG (Cha)
        text: "Chưa có tài khoản? ",
        style: TextStyle(
          color: Colors.grey, // Màu xám cho phần text thường
          fontSize: 14,
        ),
        children: [
          // 2. PHẦN TEXT BẤM ĐƯỢC (Con)
          TextSpan(
            text: "Đăng ký ngay",
            style: TextStyle(
              color: Color(0xFF2D46C6), // Màu xanh cho link
              fontWeight: FontWeight.bold,
            ),
            // <--- ĐÂY LÀ CHÌA KHÓA: Sử dụng TapGestureRecognizer
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed('splash');
              },
          ),
        ],
      ),
    );
  }
}
