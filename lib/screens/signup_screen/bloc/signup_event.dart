import 'package:equatable/equatable.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpAdminEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  SignUpAdminEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, password, phoneNumber];
}

class SignUpEmployeeEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String department;
  final String phoneNumber;

  SignUpEmployeeEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.department,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, password, department, phoneNumber];
}
