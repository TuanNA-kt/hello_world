import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_colors.dart';

enum TextFieldType { name, mail, password }

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String iconPath;
  final TextFieldType type;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(color: AppColors.gray),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: _isPasswordForm(),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.gray),
            suffixIcon: SvgPicture.asset(iconPath, width: 16, height: 16),
          ),
        ),
      ],
    );
  }

  bool _isPasswordForm() => type == TextFieldType.password;
}
