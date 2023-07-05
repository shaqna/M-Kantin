import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food_order.dart';

abstract class CheckoutReppository {
  Future<Either<Failure, List<FoodOrder>>> getOrderList();
}
