part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String username;

  const LoginSuccess(this.username);

  @override
  // TODO: implement props
  List<Object> get props => [username];

}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
