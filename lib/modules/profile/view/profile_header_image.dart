import 'package:flutter/material.dart';

class ProfileHeaderImage extends StatelessWidget {
  final double height;
  final String avatarUrl;
  const ProfileHeaderImage({super.key, required this.height, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.network(
        avatarUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
