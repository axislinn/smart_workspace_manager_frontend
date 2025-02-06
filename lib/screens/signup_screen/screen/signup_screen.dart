import 'package:smart_workspace_manager_frontend/screens/signup_screen/utils/index.dart';


class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushReplacementNamed(context, login);
          } else if (state is SignUpFailure) {
            _showErrorMessage(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is SignUpLoading) {
            return Loader();
          }
          return _buildSignUpForm(context);
        },
      ),
    );
  }


  // Method to build the sign-up form
  Widget _buildSignUpForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNameField(),
          _buildEmailField(),
          _buildPhField(),
          _buildPasswordField(),
          _buildRoleDropdown(),
          _buildDepField(),
          SizedBox(height: 20),
          _buildSignUpButton(context),
          SizedBox(height: 10),
          _buildLoginRedirectButton(context),
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


  // Method to build the role input field
  final List<String> roles = ['Admin', 'Employee'];
  String? selectedRole;

  SignUpScreen({super.key});

  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedRole,
      decoration: InputDecoration(labelText: 'Select Role'),
      items: roles.map((role) {
        return DropdownMenuItem(
          value: role,
          child: Text(role),
        );
      }).toList(),
      onChanged: (value) {
        selectedRole = value;
      },
    );
  }

  // Method to build the name input field
    Widget _buildNameField() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      obscureText: true,
      style: TextStyle(color: Colors.black),
    );
  }

  // Method to build the ph no input field
    Widget _buildPhField() {
    return TextField(
      controller: phoneNumberController,
      decoration: InputDecoration(
        labelText: 'Phone Number',
      ),
      obscureText: true,
      style: TextStyle(color: Colors.black),
    );
  }

  // Method to build the depertment input field
    Widget _buildDepField() {
    return TextField(
      controller: departmentController,
      decoration: InputDecoration(
        labelText: 'Department',
      ),
      obscureText: true,
      style: TextStyle(color: Colors.black),
    );
  }

 
  // Method to build the sign-up button
  Widget _buildSignUpButton(BuildContext context) {
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
      child: Text('Sign Up', style: TextStyle(color: Colors.grey.shade600)),
    );
  }

  // Method to build the redirect button to login
  Widget _buildLoginRedirectButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, login);
      },
      child: Text('Already have an account? Login', style: TextStyle(color: Colors.grey.shade600)),
    );
  }

  // Method to show error message
  void _showErrorMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}
