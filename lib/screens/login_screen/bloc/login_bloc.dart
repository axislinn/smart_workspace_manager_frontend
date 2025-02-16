import 'package:smart_workspace_manager_frontend/screens/login_screen/utils/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  final FlutterSecureStorage storage = const FlutterSecureStorage(); // Secure storage instance

  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginAdminEvent>(_onLoginAdmin);
    on<LoginEmployeeEvent>(_onLoginEmployee);
  }

  Future<void> _onLoginAdmin(
      LoginAdminEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final admin = await repository.loginAdmin(
        email: event.email,
        password: event.password,
      );

      // Store token securely
      await storage.write(key: 'token', value: admin.token);
      await storage.write(key: 'role', value: 'admin');

      emit(LoginSuccess(admin));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onLoginEmployee(
      LoginEmployeeEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final employee = await repository.loginEmployee(
        email: event.email,
        password: event.password,
      );

      // Store token securely
      await storage.write(key: 'token', value: employee.token);
      await storage.write(key: 'role', value: 'employee');

      emit(LoginSuccess(employee));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
