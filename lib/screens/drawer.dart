import 'package:smart_workspace_manager_frontend/screens/index.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String userName = '';
  String userEmail = '';
  String role = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final storedName = await storage.read(key: 'userName') ?? 'Unknown';
    final storedEmail = await storage.read(key: 'userEmail') ?? 'No Email';
    final storedRole = await storage.read(key: 'role') ?? '';

    if (mounted) {
      setState(() {
        userName = storedName;
        userEmail = storedEmail;
        role = storedRole;
      });
    }
  }

  Future<void> _logout(BuildContext context) async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'role');

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
          ),

          // Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              if (role == 'admin') {
                Navigator.pushReplacementNamed(context, adminHome);
              } else {
                Navigator.pushReplacementNamed(context, employeeHome);
              }
            },
          ),
          const Divider(),

          // Admin-specific options
          if (role == 'admin') ...[
            ListTile(
              leading: const Icon(Icons.supervisor_account),
              title: const Text('Manage Employees'),
              onTap: () {
                Navigator.pushNamed(context, '/manage-employees');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Admin Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/admin-settings');
              },
            ),
            const Divider(),
          ],

          // Employee-specific options
          if (role == 'employee') ...[
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Tasks'),
              onTap: () {
                Navigator.pushNamed(context, '/tasks');
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Work Schedule'),
              onTap: () {
                Navigator.pushNamed(context, '/work-schedule');
              },
            ),
            const Divider(),
          ],

          // Logout Button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
