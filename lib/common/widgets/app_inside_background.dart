import 'package:flutter/material.dart';

class AppInsideBackground extends StatelessWidget {
  const AppInsideBackground();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 228.0 / 812.0,
      widthFactor: 1.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4356B4), Color(0xFF3DCFCF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
