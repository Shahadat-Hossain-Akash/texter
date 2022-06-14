import 'package:flutter/material.dart';

import '../theme.dart';

class GlowingActionButton extends StatelessWidget {
  const GlowingActionButton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.size,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 24,
              spreadRadius: 8,
            ),
          ],
        ),
        child: ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor: AppColors.secondary,
              onTap: onPressed,
              child: SizedBox(
                width: size,
                height: size,
                child: Icon(
                  icon,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}
