import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class RemoteFailure extends Failure {
  const RemoteFailure(String message) : super(message);
}

class LocalFailure extends Failure {
  const LocalFailure(String message) : super(message);
}
