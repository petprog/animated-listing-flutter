import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/features/home/components/home_app_bar.dart';
import 'package:place_ui/features/home/components/listings.dart';
import 'package:place_ui/features/home/components/offers.dart';
import 'package:place_ui/features/home/components/welcome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.whiteSmoke, AppColors.peachColor],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeAppBar(),
                      SizedBox(
                        height: 30,
                      ),
                      Welcome(name: "Marina"),
                      SizedBox(
                        height: 40,
                      ),
                      Offers(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Listings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
