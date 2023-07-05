import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food.dart';

abstract class OrderRepository {
  Future<Either<Failure, String>> orderFood(Food food, int total);
}
