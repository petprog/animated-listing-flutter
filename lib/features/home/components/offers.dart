import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';
import 'package:place_ui/features/home/components/count_up_text.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.44,
            height: MediaQuery.of(context).size.width * 0.44,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.brightOrangeColor,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.buy.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CountUpText(
                  color: Colors.white,
                  number: 1034,
                ),
                const Text(
                  'offers',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.44,
            height: MediaQuery.of(context).size.width * 0.44,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.linenColor,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.rent.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.beaverColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CountUpText(
                  color: AppColors.beaverColor,
                  number: 2212,
                ),
                const Text(
                  'offers',
                  style: TextStyle(
                    color: AppColors.beaverColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
