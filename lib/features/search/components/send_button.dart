import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/constants/app_strings.dart';

class SendButtton extends StatelessWidget {
  const SendButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: AppColors.offWhite,
      onSelected: (value) {
        // print("Selected: $value");
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: const Icon(
              Icons.security,
              color: AppColors.deepGray,
            ),
            title: Text(
              AppStrings.cosyAreas,
              style: const TextStyle(
                color: AppColors.deepGray,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: const Icon(
              Icons.wallet,
              color: AppColors.deepGray,
            ),
            title: Text(
              AppStrings.price,
              style: const TextStyle(
                color: AppColors.deepGray,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: const Icon(
              Icons.delete_sweep_outlined,
              color: AppColors.deepGray,
            ),
            title: Text(
              AppStrings.infrastructure,
              style: const TextStyle(
                color: AppColors.deepGray,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: ListTile(
            leading: const Icon(
              Icons.layers,
              color: AppColors.deepGray,
            ),
            title: Text(
              AppStrings.withoutAnylayer,
              style: const TextStyle(
                color: AppColors.deepGray,
              ),
            ),
          ),
        ),
      ],
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Icon(
          CupertinoIcons.paperplane,
          size: 22,
          color: AppColors.whiteSmoke,
        ),
      ).asGlass(
        enabled: true,
        blurX: 30,
        blurY: 30,
        tintColor: AppColors.whiteSmoke,
        clipBorderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
