import 'package:smart_workspace_manager_frontend/screens/signup_screen/utils/index.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  final List<String> roles = ['Admin', 'Employee'];
  String? selectedRole;

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
          if (selectedRole == 'Employee') _buildDepField(),
          SizedBox(height: 20),
          _buildSignUpButton(context),
          SizedBox(height: 10),
          _buildLoginRedirectButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(labelText: 'Email'),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      style: TextStyle(color: Colors.black),
    );
  }

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
        setState(() {
          selectedRole = value;
        });
      },
    );
  }

  Widget _buildNameField() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Name'),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildPhField() {
    return TextField(
      controller: phoneNumberController,
      decoration: InputDecoration(labelText: 'Phone Number'),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildDepField() {
    return TextField(
      controller: departmentController,
      decoration: InputDecoration(labelText: 'Department'),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        final name = nameController.text.trim();
        final phoneNumber = phoneNumberController.text.trim();
        final department = departmentController.text.trim();

        if (selectedRole == 'Admin') {
          context.read<SignUpBloc>().add(
            SignUpAdminEvent(
              name: name,
              email: email,
              password: password,
              phoneNumber: phoneNumber,
            ),
          );
        } else if (selectedRole == 'Employee') {
          context.read<SignUpBloc>().add(
            SignUpEmployeeEvent(
              name: name,
              email: email,
              password: password,
              phoneNumber: phoneNumber,
              department: department,
            ),
          );
        }
      },
      child: Text('Sign Up', style: TextStyle(color: Colors.grey.shade600)),
    );
  }

  Widget _buildLoginRedirectButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, login);
      },
      child: Text('Already have an account? Login', style: TextStyle(color: Colors.grey.shade600)),
    );
  }

  void _showErrorMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
    print(error);
  }
}
