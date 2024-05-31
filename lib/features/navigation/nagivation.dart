import 'package:flutter/material.dart';
import 'package:place_ui/features/navigation/components/bottom_nav_bar.dart';
import 'package:place_ui/features/navigation/page_list.dart';
import 'package:place_ui/features/navigation/viewmodel/navigation_viewmodel.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationViewmodel>(
      builder: (context, navigationViewmodel, child) {
        return Scaffold(
          extendBody: true,
          body: Center(child: pageList[navigationViewmodel.pageIndex]),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
