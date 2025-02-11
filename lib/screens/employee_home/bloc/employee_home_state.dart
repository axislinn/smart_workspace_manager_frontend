part of 'employee_home_bloc.dart';

sealed class EmployeeHomeState extends Equatable {
  const EmployeeHomeState();
  
  @override
  List<Object> get props => [];
}

final class EmployeeHomeInitial extends EmployeeHomeState {}
