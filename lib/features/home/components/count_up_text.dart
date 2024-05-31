import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountUpText extends StatefulWidget {
  final int number;
  final Color color;
  const CountUpText({super.key, required this.number, required this.color});

  @override
  State<CountUpText> createState() => _CountUpTextState();
}

class _CountUpTextState extends State<CountUpText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _countUpAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _countUpAnimation = IntTween(begin: 0, end: widget.number).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedNumber = NumberFormat('#,##0', 'en_US')
        .format(_countUpAnimation.value)
        .replaceAll(',', ' ');
    return Text(
      formattedNumber,
      style: TextStyle(
        fontSize: 40,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: widget.color,
      ),
    );
  }
}
