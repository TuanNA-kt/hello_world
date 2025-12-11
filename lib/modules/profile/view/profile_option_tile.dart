import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionTile extends StatelessWidget {
  final String assetName;
  final String title;
  final Widget? trailing;
  final bool showArrow;
  final void Function() onTap;

  const ProfileOptionTile({
    super.key,
    required this.assetName,
    required this.title,
    required this.onTap,
    this.trailing,
    this.showArrow = false
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(assetName),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) trailing!,
          if (showArrow) SvgPicture.asset('assets/images/ic_next.svg'),
        ],
      ),
      onTap: onTap,
    );
  }
}
