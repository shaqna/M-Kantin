part of 'order_bloc.dart';


abstract class OrderState extends Equatable {
    @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final String message;

  OrderSuccess(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class OrderFailed extends OrderState {
  final String message;

  OrderFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}