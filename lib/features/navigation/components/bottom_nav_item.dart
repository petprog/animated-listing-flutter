import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final Function()? onTap;
  final bool active;
  final IconData? icon;
  const BottomNavItem({
    super.key,
    this.onTap,
    this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: active ? 53 : 45,
        width: active ? 53 : 45,
        decoration: BoxDecoration(
          color: active ? AppColors.brightOrangeColor : AppColors.blackColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
