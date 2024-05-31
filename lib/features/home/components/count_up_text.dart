import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountUpText extends StatelessWidget {
  final Animation<double> animation;
  final int number;
  final Color color;
  const CountUpText(
      {super.key,
      required this.number,
      required this.color,
      required this.animation});

  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat('#,##0', 'en_US')
        .format(animation.value * number)
        .replaceAll(',', ' ');
    return Text(
      formattedNumber,
      style: TextStyle(
        fontSize: 40,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
