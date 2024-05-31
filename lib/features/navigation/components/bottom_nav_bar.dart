import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/features/navigation/viewmodel/navigation_viewmodel.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainScreenNotifier = context.watch<NavigationViewmodel>();
    return SafeArea(
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.charcoalGrayColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              onTap: () {
                mainScreenNotifier.pageIndex = 0;
              },
              active: mainScreenNotifier.pageIndex == 0,
              icon: CupertinoIcons.search,
            ),
            BottomNavItem(
              onTap: () {
                mainScreenNotifier.pageIndex = 1;
              },
              active: mainScreenNotifier.pageIndex == 1,
              icon: Ionicons.chatbox,
            ),
            BottomNavItem(
              onTap: () {
                mainScreenNotifier.pageIndex = 2;
              },
              active: mainScreenNotifier.pageIndex == 2,
              icon: Foundation.home,
            ),
            BottomNavItem(
              onTap: () {
                mainScreenNotifier.pageIndex = 3;
              },
              active: mainScreenNotifier.pageIndex == 3,
              icon: Ionicons.heart,
            ),
            BottomNavItem(
              onTap: () {
                mainScreenNotifier.pageIndex = 4;
              },
              active: mainScreenNotifier.pageIndex == 4,
              icon: Ionicons.person,
            ),
          ],
        ),
      ),
    );
  }
}
