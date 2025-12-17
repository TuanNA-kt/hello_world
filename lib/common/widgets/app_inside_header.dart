import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class AppInsideHeader extends StatelessWidget {
  final String header;
  final String addIconPath;
  final VoidCallback onAddPressed;

  const AppInsideHeader({super.key, required this.header, required this.addIconPath, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    header,
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                  )
              ),
              InkWell(
                onTap: () {
                  onAddPressed;
                },
                customBorder: const CircleBorder(),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                  child: Center(
                      child: SvgPicture.asset(addIconPath)
                  ),
                ),
              ),
            ],
          )
      );
  }
}