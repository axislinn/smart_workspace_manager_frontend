import 'package:flutter/material.dart';
import 'package:smart_workspace_manager_frontend/screens/admin_home/utils/analytics_card.dart';
import 'package:smart_workspace_manager_frontend/widgets/custom_appbar.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Company Dashboard'),
      drawer: const Drawer(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: 16),
          _buildAnalyticsGrid(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Overall Analysis',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAnalyticsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        AnalyticsCard(title: 'Projects Completed', value: '45', icon: Icons.task_alt),
        AnalyticsCard(title: 'Total Revenue', value: '\$150K', icon: Icons.monetization_on),
        AnalyticsCard(title: 'Active Employees', value: '124', icon: Icons.people),
        AnalyticsCard(title: 'Ongoing Projects', value: '8', icon: Icons.trending_up),
      ],
    );
  }
}
