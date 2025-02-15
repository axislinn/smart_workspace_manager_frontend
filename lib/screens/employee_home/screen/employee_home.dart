import 'package:flutter/material.dart';
import 'package:smart_workspace_manager_frontend/screens/admin_home/utils/index.dart';

class EmployeeHome extends StatelessWidget {
  const EmployeeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Employee Home'),
      ),
      body: Center( 
        child:Text('Employee Home'),
      ),
    );
  }
}