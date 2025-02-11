import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_home_event.dart';
part 'employee_home_state.dart';

class EmployeeHomeBloc extends Bloc<EmployeeHomeEvent, EmployeeHomeState> {
  EmployeeHomeBloc() : super(EmployeeHomeInitial()) {
    on<EmployeeHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
