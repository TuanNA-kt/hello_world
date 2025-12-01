import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4356B4), Color(0xFF3DCFCF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}