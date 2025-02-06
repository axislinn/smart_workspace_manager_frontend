import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_workspace_manager_frontend/screens/login_screen/utils/index.dart';

class SignUpRepository {
  final String baseUrl = Url;

  SignUpRepository();

  Future<String> signUpAdmin({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final url = Uri.parse('$baseUrl/admin/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'role': 'admin',
      }),
    );

    if (response.statusCode == 201) {
      return 'Admin sign-up successful';
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future<String> signUpEmployee({
    required String name,
    required String email,
    required String password,
    required String department,
    required String phoneNumber,
  }) async {
    final url = Uri.parse('$baseUrl/employee/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'department': department,
        'phoneNumber': phoneNumber,
        'role': 'employee',
      }),
    );

    if (response.statusCode == 201) {
      return 'Employee sign-up successful';
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
