import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/data/source/local/food_local_data_source.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FoodLocalDataSource localDataSource;

  OrderRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, String>> orderFood(Food food, int total) async {
    try {
      final result = await localDataSource.insertFoodOrder(food, total);
      return Right(result);
    } on LocalFailure {
      return const Left(LocalFailure('failed add food to cart'));
    }
  }
}
