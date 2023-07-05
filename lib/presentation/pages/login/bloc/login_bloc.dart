import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String defaultUsername = 'AdminShihlin';
  final String defaultPassword = 'test';

  LoginBloc() : super(LoginInitial()) {
    on<OnLogin>((event, emit) {
      emit(LoginLoading());
      if (event.username != defaultUsername ||
          event.password != defaultPassword) {
        emit(const LoginFailed('username atau password salah'));
      }

      emit(LoginSuccess(event.username));
    });
  }
}
