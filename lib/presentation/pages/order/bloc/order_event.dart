part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnOrderingFood extends OrderEvent {
  final Food food;
  final int total;

  const OnOrderingFood(this.food, this.total);

  @override
  // TODO: implement props
  List<Object?> get props => [food, total];
}
