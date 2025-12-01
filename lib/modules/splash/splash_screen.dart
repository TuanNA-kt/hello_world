import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/widgets/app_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double parentHeight = constraints.maxHeight;

        final double iconWidth = parentWidth / 2.0;
        final double marginTop = parentHeight * 208.0 / 812.0;

        return Stack(
          children: [
            AppBackground(),
            Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: marginTop),
                SvgPicture.asset(
                  'assets/images/ic_splash_plane_icon.svg',
                  fit: BoxFit.fitWidth,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Awesome ',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                        text: 'chat',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        );
      },
    );
  }
}
