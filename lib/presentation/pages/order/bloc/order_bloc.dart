import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/usecase/order_food_use_case.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderFoodUseCase _orderFoodUseCase;

  OrderBloc(this._orderFoodUseCase) : super(OrderInitial()) {
    on<OnOrderingFood>((event, emit) async {
      emit(OrderLoading());
      final newFood = Food(
        id: event.food.id,
        name: event.food.name,
        category: event.food.category,
        price: event.food.price * event.total,
        image: event.food.image,
      );
      final result = await _orderFoodUseCase.execute(newFood, event.total);

      result.fold((failure) => emit(OrderFailed(failure.message)),
          (message) => emit(OrderSuccess(message)));
    });
  }
}
