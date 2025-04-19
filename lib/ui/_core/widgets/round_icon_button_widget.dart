import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class BuildRoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const BuildRoundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = AppColors.mainColor,
    this.iconColor = Colors.black,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 18)),
      ),
    );
  }
}
