import 'package:flutter/material.dart';
import 'package:place_ui/constants/app_colors.dart';
import 'package:place_ui/features/navigation/nagivation.dart';
import 'package:place_ui/features/navigation/viewmodel/navigation_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewmodel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Roboto",
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.brightOrangeColor,
          ),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
