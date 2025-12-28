import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'constants/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MultiLingual Earbuds Translator',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: AppConstants.backgroundColor,
        textTheme: AppConstants.textTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.secondaryColor,
            foregroundColor: AppConstants.textColor,
          ),
        ),
      ),
    );
  }
}
