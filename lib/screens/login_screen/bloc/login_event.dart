import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginAdminEvent extends LoginEvent {
  final String email;
  final String password;

  LoginAdminEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginEmployeeEvent extends LoginEvent {
  final String email;
  final String password;

  LoginEmployeeEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class CheckLoginStatus extends LoginEvent {
  @override
  List<Object?> get props => [];
}
