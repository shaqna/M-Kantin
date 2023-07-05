import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mkantin/domain/model/food_order.dart';
import 'package:mkantin/domain/usecase/get_list_checkout.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final GetListCheckout _getListCheckout;

  CheckoutBloc(this._getListCheckout) : super(CheckoutEmpty()) {
    on<OnFetchCheckoutItem>((event, emit) async {
      emit(CheckoutLoading());

      final result = await _getListCheckout.execute();

      result.fold((l) => emit(CheckoutError(l.message)), (r) => emit(CheckoutHasData(r)));
    });
  }
}
