import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/portfolio_controller.dart';
import 'views/home_view.dart';

void main() {
  Get.put(PortfolioController());
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color backgroundColor = Color(0xFFFFF8F2);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Leanur Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryOrange,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF555555),
            height: 1.6,
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}