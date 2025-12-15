import 'package:flutter/material.dart';

// Enum to define the common types of snackbars (for easy styling)
enum SnackBarType { success, error, info }

class SnackBarUtils {

  /// Displays a customizable SnackBar using the provided context.
  static void showSnackBar(
      BuildContext context, {
        required String message,
        SnackBarType type = SnackBarType.info,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Determine color based on the SnackBarType
    Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
      case SnackBarType.error:
        backgroundColor = Colors.red;
      case SnackBarType.info:
        backgroundColor = Colors.white;
    }

    // Ensure we can access the ScaffoldMessenger
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Clear any previous snackbars to prevent stacking
    scaffoldMessenger.hideCurrentSnackBar();

    // Show the new snackbar
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating, // Recommended for modern look
        // Optional: Add an action button (e.g., 'Dismiss')
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            scaffoldMessenger.hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}