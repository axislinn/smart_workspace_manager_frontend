import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_workspace_manager_frontend/screens/login_screen/bloc/login_bloc.dart';
import 'package:smart_workspace_manager_frontend/screens/login_screen/bloc/login_repository.dart';
import 'package:smart_workspace_manager_frontend/screens/login_screen/screen/login_screen.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/bloc/signup_bloc.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/screen/signup_screen.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/utils/index.dart';
import 'package:smart_workspace_manager_frontend/screens/splash_screen/screen/splash_screen.dart';
import 'package:smart_workspace_manager_frontend/utils/route_constants.dart';

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
          create: (context) => SignUpBloc(
            repository: SignUpRepository()),
          child: SignUpScreen(),
              ));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
