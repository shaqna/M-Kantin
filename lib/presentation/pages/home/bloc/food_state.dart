part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodHasData extends FoodState {
  final List<Food> foodList;

  const FoodHasData(this.foodList);

  @override
  List<Object> get props => [foodList];
}

class FoodError extends FoodState {
  final String message;

  const FoodError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
