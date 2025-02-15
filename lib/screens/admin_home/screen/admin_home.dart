import 'package:flutter/material.dart';
import 'package:smart_workspace_manager_frontend/screens/admin_home/utils/index.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Admin Home'),
      ),
      body: Center( 
        child:Text('Admin Home'),
      ),
    );
  }
}