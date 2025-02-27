import 'package:smart_workspace_manager_frontend/screens/admin_home/screen/admin_home.dart';
import 'package:smart_workspace_manager_frontend/screens/employee_home/screen/employee_home.dart';
import 'package:smart_workspace_manager_frontend/screens/login_screen/screen/login_screen.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/screen/signup_screen.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/utils/index.dart';
import 'package:smart_workspace_manager_frontend/screens/splash_screen/screen/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => LoginBloc(
            repository: LoginRepository(),
          ),
          child: LoginScreen(),
        ),
      );

    case signUp:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => SignUpBloc(repository: SignUpRepository()),
                child: SignUpScreen(),
              ));

    case adminHome:
      return MaterialPageRoute(builder: (_) => AdminHome());

    case employeeHome:
      return MaterialPageRoute(builder: (_) => EmployeeHome());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
