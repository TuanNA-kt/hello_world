import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../app_colors.dart';

enum TextFieldType { name, mail, password, phone, birthday }

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String iconPath;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function(DateTime)? onDateChanged; // Add this
  final DateTime? initialDate; // Add this
  final TextFieldType type;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    this.errorText,
    this.onChanged,
    this.onDateChanged, // Add this
    this.initialDate, // Add this
    required this.type,
  });

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now().subtract(Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: AppColors.white,
              surface: AppColors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && onDateChanged != null) {
      onDateChanged!(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBirthday = type == TextFieldType.birthday;

    final String displayText = isBirthday && initialDate != null
        ? DateFormat('dd/MM/yyyy').format(initialDate!)
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(color: AppColors.gray),
        ),
        TextFormField(
          readOnly: isBirthday, // Read-only for birthday
          obscureText: _isPasswordForm(),
          onTap: isBirthday ? () => _showDatePicker(context) : null,
          onChanged: !isBirthday ? onChanged : null,
          controller: isBirthday ? TextEditingController(text: displayText) : null,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.gray),
            suffixIcon: SizedBox(child: SvgPicture.asset(iconPath)),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 16,
              maxWidth: 16,
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }

  bool _isPasswordForm() => type == TextFieldType.password;
}