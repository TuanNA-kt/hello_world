import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../common/app_colors.dart';


class BirthdayInputField extends StatelessWidget {
  final String label;
  final String iconPath;
  final String? errorText;
  final ValueNotifier<DateTime?> dateController;

  const BirthdayInputField({
    super.key,
    required this.label,
    required this.iconPath,
    required this.dateController,
    this.errorText,
  });

  Future<void> _showDatePicker(BuildContext context) async {
    final initialDate = dateController.value ?? DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
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
      dateController.value = pickedDate; // Update controller
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime?>(
      valueListenable: dateController,
      builder: (context, selectedDate, child) {
        final String displayDate = selectedDate != null
            ? DateFormat('dd/MM/yyyy').format(selectedDate)
            : "dd/mm/yyyy";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(color: AppColors.gray),
            ),
            TextFormField(
              readOnly: true,
              onTap: () => _showDatePicker(context),
              controller: TextEditingController(
                  text: displayDate == "dd/mm/yyyy" ? '' : displayDate
              ),
              style: TextStyle(
                  fontSize: 18,
                  color: displayDate == "dd/mm/yyyy" ? AppColors.gray : Colors.black
              ),
              decoration: InputDecoration(
                hintText: displayDate,
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
      },
    );
  }
}