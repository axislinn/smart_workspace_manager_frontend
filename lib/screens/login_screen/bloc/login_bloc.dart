import 'package:smart_workspace_manager_frontend/screens/login_screen/utils/index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

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
      emit(LoginSuccess(employee));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
