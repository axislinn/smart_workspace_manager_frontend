import 'package:smart_workspace_manager_frontend/screens/splash_screen/utils/index.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, login);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 57, 98, 160),
//               Color.fromARGB(255, 40, 101, 161),
//               Color(0xFF42A5F5),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 'assets/logo.png',
//                 height: 100,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Faster Programming',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   letterSpacing: 2.0,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const SpinKitPulse(
//                 color: Colors.white,
//                 size: 50.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Adding a delay before navigating to the login screen
//     Future.delayed(Duration(seconds: 3), () {
//       // Dispatch the check login status event here
//       // You can check if the user is logged in directly via LoginBloc or your authentication state
//       BlocProvider.of<LoginBloc>(context).add(CheckLoginStatus());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//             body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccess) {
//             final user = state.user;
//             if (user is Admin) {
//               Navigator.pushReplacementNamed(context, adminHome);
//             } else if (user is Employee) {
//               Navigator.pushReplacementNamed(context, employeeHome);
//             }
//           } else if (state is LoginFailure) {
//             Navigator.pushReplacementNamed(context, login);
//           }
//         },
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 57, 98, 160),
//                 Color.fromARGB(255, 40, 101, 161),
//                 Color(0xFF42A5F5),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset(
//                   'assets/logo.png',
//                   height: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Faster Programming',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: 2.0,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const SpinKitPulse(
//                   color: Colors.white,
//                   size: 50.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? token = await storage.read(key: 'token');
    String? role = await storage.read(key: 'role');

    Future.delayed(Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        if (role == 'admin') {
          Navigator.pushReplacementNamed(context, adminHome); // Admin Home Page
        } else if (role == 'employee') {
          Navigator.pushReplacementNamed(context, employeeHome); // Employee Home Page
        } else {
          Navigator.pushReplacementNamed(context, login); // If role is invalid
        }
      } else {
        Navigator.pushReplacementNamed(context, login); // Navigate to Login
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 57, 98, 160),
              Color.fromARGB(255, 40, 101, 161),
              Color(0xFF42A5F5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Faster Programming',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),
              const SpinKitPulse(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}