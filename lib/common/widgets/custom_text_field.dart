import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_colors.dart';

enum TextFieldType { name, mail, password }

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String iconPath;
  final String? errorText;
  final void Function(String) onChanged;
  final TextFieldType type;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    required this.errorText,
    required this.onChanged,
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
        TextFormField(
          obscureText: _isPasswordForm(),
          onChanged: onChanged,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.gray),
            suffixIcon: SizedBox(child: SvgPicture.asset(iconPath)),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 16,
              maxWidth: 16,
            ),
            errorText: (errorText != null) ? errorText : null,
          ),
        ),
      ],
    );
  }

  bool _isPasswordForm() => type == TextFieldType.password;
}
