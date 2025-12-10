import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final bool showArrow;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) trailing!,
          if (showArrow) const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () {},
    );
  }
}
