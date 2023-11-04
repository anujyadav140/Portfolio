import 'package:anuj_yadav/core/config/environment.dart';
import 'package:anuj_yadav/design/utils/app_theme.dart';
import 'package:anuj_yadav/features/home/home_page.dart';
import 'package:anuj_yadav/project/di/app_dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  Environment.initialize(flavour: Flavour.production);
  AppDependencyInjection.initDiServices();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Anuj Yadav👋 | Full Stack Dev',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
