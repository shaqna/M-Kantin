part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnFetchCheckoutItem extends CheckoutEvent {}
