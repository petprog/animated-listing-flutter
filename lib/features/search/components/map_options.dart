import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:glass/glass.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';
import 'package:place_ui/features/search/components/send_options.dart';

import 'glass_icon_button.dart';

class MapOptions extends StatefulWidget {
  final Animation<double> scaleAnimation;

  const MapOptions({super.key, required this.scaleAnimation});

  @override
  State<MapOptions> createState() => _MapOptionsState();
}

class _MapOptionsState extends State<MapOptions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void tapSend() {
    if (_animation.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
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
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: ScaleTransition(
                scale: widget.scaleAnimation,
                child: GlassIconButton(
                  iconData: Icons.filter_alt_outlined,
                  iconSize: 22,
                  iconColor: AppColors.whiteSmoke,
                  blurX: 20,
                  blurY: 20,
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
            ),
            ScaleTransition(
              scale: _animation,
              alignment: Alignment.bottomLeft,
              child: SendOptions(close: tapSend),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScaleTransition(
              scale: widget.scaleAnimation,
              child: GlassIconButton(
                iconData: CupertinoIcons.paperplane,
                iconSize: 22,
                iconColor: AppColors.whiteSmoke,
                blurX: 30,
                blurY: 30,
                onTap: tapSend,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            ScaleTransition(
              scale: widget.scaleAnimation,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const Icon(
                      MaterialCommunityIcons.format_list_bulleted,
                      size: 20,
                      color: AppColors.whiteSmoke,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppStrings.listVariants,
                      style: const TextStyle(
                        color: AppColors.whiteSmoke,
                      ),
                    )
                  ],
                ),
              ).asGlass(
                enabled: true,
                blurX: 30,
                blurY: 30,
                tintColor: AppColors.whiteSmoke,
                clipBorderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        )
      ],
    );
  }
}
