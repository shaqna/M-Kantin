part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckoutEmpty extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutHasData extends CheckoutState {
  final List<FoodOrder> foodOrder;

  CheckoutHasData(this.foodOrder);

  @override
  // TODO: implement props
  List<Object?> get props => [foodOrder];
}

class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
