import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class GlassIconButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final double blurX;
  final double blurY;
  final VoidCallback onTap;
  final BorderRadius borderRadius;

  const GlassIconButton({
    super.key,
    required this.iconData,
    required this.iconSize,
    required this.iconColor,
    required this.blurX,
    required this.blurY,
    required this.onTap,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ).asGlass(
        enabled: true,
        blurX: blurX,
        blurY: blurY,
        tintColor: iconColor,
        clipBorderRadius: borderRadius,
      ),
    );
  }
}
