import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<Food>>> fetchFoodList();
}