import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food_order.dart';
import 'package:mkantin/domain/repository/checkout_repostitory.dart';

class GetListCheckout {
  final CheckoutReppository _checkoutReppository;

  GetListCheckout(this._checkoutReppository);

  Future<Either<Failure, List<FoodOrder>>> execute() {
    return _checkoutReppository.getOrderList();
  }
}
