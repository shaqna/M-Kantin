import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/repository/food_repository.dart';

class GetListFood {
  final FoodRepository repository;

  GetListFood(this.repository);

  Future<Either<Failure, List<Food>>> execute() {
    return repository.fetchFoodList();
  }
}
