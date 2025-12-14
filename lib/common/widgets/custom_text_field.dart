import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../app_colors.dart';

enum TextFieldType { name, mail, password, phone, birthday }

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String iconPath;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function(DateTime)? onDateChanged;
  final DateTime? initialDate;
  final String? initialText;
  final TextFieldType type;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    this.errorText,
    this.onChanged,
    this.onDateChanged,
    this.initialDate,
    this.initialText,
    required this.type,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _internalController;
  late final bool _isControllerExternal;

  @override
  void initState() {
    super.initState();
    _isControllerExternal = widget.controller != null;

    if (_isControllerExternal) {
      _internalController = widget.controller!;
    } else {
      final initialValue = _getInitialValue();
      _internalController = TextEditingController(text: initialValue);
    }
  }

  @override
  void dispose() {
    // Only dispose if we created the controller internally
    if (!_isControllerExternal) {
      _internalController.dispose();
    }
    super.dispose();
  }

  String _getInitialValue() {
    if (widget.type == TextFieldType.birthday && widget.initialDate != null) {
      return DateFormat('dd/MM/yyyy').format(widget.initialDate!);
    }
    return widget.initialText ?? '';
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ??
          DateTime.now().subtract(const Duration(days: 365 * 18)),
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

    if (pickedDate != null) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      _internalController.text = formattedDate;
      widget.onDateChanged?.call(pickedDate);
    }
  }

  bool get _isBirthday => widget.type == TextFieldType.birthday;
  bool get _isPassword => widget.type == TextFieldType.password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: const TextStyle(color: AppColors.gray),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: _internalController,
          readOnly: _isBirthday,
          obscureText: _isPassword,
          onTap: _isBirthday ? () => _showDatePicker(context) : null,
          onChanged: !_isBirthday ? widget.onChanged : null,
          style: const TextStyle(fontSize: 18),
          keyboardType: _getKeyboardType(),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: AppColors.gray),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                widget.iconPath,
                width: 16,
                height: 16,
              ),
            ),
            errorText: widget.errorText,
            errorMaxLines: 2,
          ),
        ),
      ],
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case TextFieldType.mail:
        return TextInputType.emailAddress;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.name:
        return TextInputType.name;
      default:
        return TextInputType.text;
    }
  }
}