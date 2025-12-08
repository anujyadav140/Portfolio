import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/pages/minimalist_home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MinimalistTheme.darkTheme,
      title: 'Anuj Yadav | Product Manager',
      debugShowCheckedModeBanner: false,
      home: const MinimalistHomePage(),
    );
  }
}
