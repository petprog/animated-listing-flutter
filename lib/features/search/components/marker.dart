import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/features/search/viewmodel/tap_view_model.dart';

class Marker extends StatefulWidget {
  final String text;
  const Marker({
    super.key,
    required this.text,
  });

  @override
  State<Marker> createState() => _MarkerState();
}

class _MarkerState extends State<Marker> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleController.forward().then((value) {
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      alignment: Alignment.bottomLeft,
      child: ValueListenableBuilder<bool>(
        valueListenable: tapVm.valueNotifier,
        builder: (context, value, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: 45,
          width: value ? 45 : 75,
          decoration: const BoxDecoration(
            color: AppColors.brightOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(2),
            ),
          ),
          child: value
              ? const Center(
                  child: Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
