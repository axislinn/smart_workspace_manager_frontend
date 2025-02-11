import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;
  final String token;
  
  SignUpSuccess(this.message, this.token);

  @override
  List<Object?> get props => [message];
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);

  @override
  List<Object?> get props => [error];
}
