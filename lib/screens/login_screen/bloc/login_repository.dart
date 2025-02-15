import 'package:http/http.dart' as http;
import 'package:smart_workspace_manager_frontend/screens/login_screen/utils/index.dart';

// login_repository.dart
class LoginRepository {
  final String baseUrl = apiUrl;

  LoginRepository();

  // Future<Admin> loginAdmin({required String email, required String password}) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/admin/login'),
  //     body: jsonEncode({'email': email, 'password': password}),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     return Admin.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to login as Admin');
  //   }
  // }

  // Future<Employee> loginEmployee({required String email, required String password}) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/employee/login'),
  //     body: jsonEncode({'email': email, 'password': password}),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     return Employee.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to login as Employee');
  //   }
  // }


  Future<Admin> loginAdmin({required String email, required String password}) async {
  final response = await http.post(
    Uri.parse('$baseUrl/admin/login'),
    body: jsonEncode({'email': email, 'password': password}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return Admin.fromJson(data); // Correct parsing
  } else {
    throw Exception('Failed to login as Admin: ${response.body}');
  }
}


  Future<Employee> loginEmployee({required String email, required String password}) async {
  final response = await http.post(
    Uri.parse('$baseUrl/employee/login'),
    body: jsonEncode({'email': email, 'password': password}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return Employee.fromJson(data); // Correct parsing
  } else {
    throw Exception('Failed to login as Employee: ${response.body}');
  }
}
}