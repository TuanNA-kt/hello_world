import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/common/app_colors.dart';
import 'package:hello_world/common/widgets/custom_text_field.dart';

import '../../register/bloc/register_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset('assets/images/ic_arrow_back.svg'),
                onPressed: () => context.pop()
              ),
            ),
            SizedBox(height: 48),
            Text(
              'Đăng ký',
              style: TextStyle(
                fontSize: 26,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 61),
            _FullnameInput(),
            SizedBox(height: 31),
            _UsernameInput(),
            SizedBox(height: 31),
            _PasswordInput(),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: _TermsAndConditionsCheckbox(),
            ),
            SizedBox(height: 47),
            _RegisterButton(),
            SizedBox(height: 123),
            Align(alignment: Alignment.center, child: _RegisterFootage()),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}

class _FullnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterBloc bloc) => bloc.state.fullname.displayError,
    );

    final bloc = context.read<RegisterBloc>();

    return CustomTextField(
      label: 'HỌ VÀ TÊN',
      hint: 'Nguyen Van A',
      iconPath: 'assets/images/ic_person.svg',
      type: TextFieldType.name,

      errorText: displayError != null ? 'Invalid name' : null,

      onChanged: (fullname) {
        bloc.add(RegisterFullnameChanged(fullname));
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterBloc bloc) => bloc.state.username.displayError,
    );

    final bloc = context.read<RegisterBloc>();

    return CustomTextField(
      label: 'EMAIL',
      hint: 'yourname@gmail.com',
      iconPath: 'assets/images/ic_mail.svg',
      type: TextFieldType.mail,

      errorText: displayError != null ? 'Invalid Email' : null,

      onChanged: (username) {
        bloc.add(RegisterUsernameChanged(username));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterBloc bloc) => bloc.state.password.displayError,
    );

    final bloc = context.read<RegisterBloc>();

    return CustomTextField(
      label: 'Password',
      hint: '********',
      iconPath: 'assets/images/ic_key.svg',
      type: TextFieldType.password,

      errorText: displayError != null ? 'Invalid Password' : null,

      onChanged: (password) {
        bloc.add(RegisterPasswordChanged(password));
      },
    );
  }
}

class _TermsAndConditionsCheckbox extends StatelessWidget {
  const _TermsAndConditionsCheckbox();

  @override
  Widget build(BuildContext context) {
    final bool isAgreed = context.select(
      (RegisterBloc bloc) => bloc.state.isAgreed,
    );
    final bloc = context.read<RegisterBloc>();

    return Row(
      children: [
        SizedBox(
          height: 22,
          width: 22,
          child: Checkbox(
            value: isAgreed,
            activeColor: AppColors.primaryBlue,
            onChanged: (newValue) {
              if (newValue != null) {
                bloc.add(RegisterAgreementChanged(newValue));
              }
            },
          ),
        ),
        SizedBox(width: 11),
        RichText(
          text: TextSpan(
            text: "Tôi đồng ý với các ",
            style: TextStyle(color: AppColors.gray, fontSize: 14),
            children: [
              TextSpan(
                text: "chính sách",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Chinh sach");
                  },
              ),
              TextSpan(text: " và "),
              TextSpan(
                text: "điều khoản",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Dieu khoan");
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (RegisterBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((RegisterBloc bloc) => bloc.state.isValid);
    final isAgreed = context.select((RegisterBloc bloc) => bloc.state.isAgreed);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isValid && isAgreed
            ? () => context.read<RegisterBloc>().add(RegisterSubmitted())
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          disabledBackgroundColor: AppColors.gray,
          minimumSize: const Size.fromHeight(52),
        ),
        child: const Text("ĐĂNG KÝ", style: TextStyle(color: AppColors.white)),
      ),
    );
  }
}

class _RegisterFootage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Đã có tài khoản? ",
        style: TextStyle(color: Colors.grey, fontSize: 14),
        children: [
          TextSpan(
            text: "Đăng nhập ngay",
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed('login');
              },
          ),
        ],
      ),
    );
  }
}
