import 'package:flutter/material.dart';
import 'package:she_sos_v1/pages/mapview_page.dart';
import 'package:she_sos_v1/pages/home_page.dart';
import 'package:she_sos_v1/pages/login_page.dart';
import 'package:she_sos_v1/pages/register_page.dart';
import 'package:she_sos_v1/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
