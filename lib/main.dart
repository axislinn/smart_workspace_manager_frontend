import 'package:flutter/material.dart';
import 'package:smart_workspace_manager_frontend/utils/app_navigation.dart';
import 'package:smart_workspace_manager_frontend/utils/route_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    showPerformanceOverlay: true,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: generateRoute,
    initialRoute: splash,
    );
  }
}