import 'package:flutter/material.dart';
import 'package:texter/theme.dart';

class IconBackground extends StatelessWidget {
  const IconBackground(
      {Key? key, required this.icon, required this.onTap, required this.colors})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.secondary,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: colors,
            size: 20,
          ),
        ),
      ),
    );
  }
}
