import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/usecase/get_list_food.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetListFood _getListFood;

  FoodBloc(this._getListFood) : super(FoodInitial()) {
    on<OnFetchFoodList>((event, emit) async {
      final result = await _getListFood.execute();

      result.fold((failure) {
        emit(FoodError(failure.message));
      }, (data) {
        emit(FoodHasData(data));
      });
    });
  }
}
