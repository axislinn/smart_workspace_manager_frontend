import 'package:bloc/bloc.dart';
import 'package:smart_workspace_manager_frontend/screens/signup_screen/utils/index.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository repository;

  SignUpBloc({required this.repository}) : super(SignUpInitial()) {
    on<SignUpAdminEvent>(_onSignUpAdmin);
    on<SignUpEmployeeEvent>(_onSignUpEmployee);
  }

  Future<void> _onSignUpAdmin(
      SignUpAdminEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final message = await repository.signUpAdmin(
        name: event.name,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
      );
      emit(SignUpSuccess(message, '')); // Add token
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  Future<void> _onSignUpEmployee(
      SignUpEmployeeEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final message = await repository.signUpEmployee(
        name: event.name,
        email: event.email,
        password: event.password,
        department: event.department,
        phoneNumber: event.phoneNumber,
      );
      emit(SignUpSuccess(message, '')); // Add token
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}

