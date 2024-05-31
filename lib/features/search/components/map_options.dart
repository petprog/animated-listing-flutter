import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:glass/glass.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';
import 'package:place_ui/features/search/components/send_button.dart';

class MapOptions extends StatelessWidget {
  final Animation<double> scaleAnimation;

  const MapOptions({super.key, required this.scaleAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  size: 22,
                  color: AppColors.whiteSmoke,
                ),
              ).asGlass(
                enabled: true,
                blurX: 20,
                blurY: 20,
                tintColor: AppColors.whiteSmoke,
                clipBorderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScaleTransition(
              scale: scaleAnimation,
              child: const SendButtton(),
            ),
            ScaleTransition(
              scale: scaleAnimation,
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
