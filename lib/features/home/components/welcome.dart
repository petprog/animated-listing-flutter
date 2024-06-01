import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';
import 'package:place_ui/utils/screen_utils.dart';

class Welcome extends StatefulWidget {
  final String name;
  const Welcome({super.key, required this.name});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _opacityAnimation1 =
        Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
    _opacityAnimation2 =
        Tween<double>(begin: 0.1, end: 1.0).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
            .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeTransition(
          opacity: _opacityAnimation1,
          child: Text(
            "${AppStrings.hi}, ${widget.name}",
            style: const TextStyle(
              fontSize: 18,
              height: 1.1,
              color: AppColors.beaverColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation1,
            child: SizedBox(
              width: context.screenWidth * 0.7,
              child: Text(
                AppStrings.letsSelect,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation2,
            child: SizedBox(
              width: context.screenWidth * 0.7,
              child: Text(
                AppStrings.perfectPlace,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
