import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppNoResult extends StatelessWidget {
  const AppNoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/ic_search_empty.svg',
            fit: BoxFit.fitWidth,
          ),
          Text(
            "Khong tim thay ket qua phu hop",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

}