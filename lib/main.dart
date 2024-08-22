import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_new_things/app_life_cycle/app_life_cycle_display.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        home: AppLifecycleDisplay());
  }
}
