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
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.secondary,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: colors,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class IconBorder extends StatelessWidget {
  const IconBorder({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      splashColor: AppColors.secondary,
      onTap: onTap,
      child: Container(
        //color: Colors.blue,
        height: 40,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            icon,
            color: AppColors.secondary,
            size: 28,
          ),
        ),
      ),
    );
  }
}
