import 'package:smart_workspace_manager_frontend/screens/login_screen/utils/index.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is LoginFailure) {
            _showErrorMessage(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Loader();
          }
          return _buildLoginForm(context);
        },
      ),
    );
  }

 // Method to build the login form
  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildEmailField(),
          _buildPasswordField(),
          SizedBox(height: 20),
          _buildLoginButton(context),
          SizedBox(height: 10),
          _buildSignUpRedirectButton(context),
        ],
      ),
    );
  }

  // Method to build the email input field
  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  // Method to build the password input field
  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      style: TextStyle(color: Colors.black),
    );
  }

  // Method to build the login button
  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        if (roleController.text.trim().toLowerCase() == 'admin') {
          context.read<LoginBloc>().add(
            LoginAdminEvent(email: email, password: password),
          );
        } else {
          context.read<LoginBloc>().add(
            LoginEmployeeEvent(email: email, password: password),
          );
        }
      },
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  // Method to build the redirect button to signup
  Widget _buildSignUpRedirectButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, signUp);
      },
      child: Text('Sign Up', style: TextStyle(color: Colors.grey)),
    );
  }

  // Method to show error message
  void _showErrorMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
    print(error);
  }
}