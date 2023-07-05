import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/data/source/local/food_local_data_source.dart';
import 'package:mkantin/domain/model/food_order.dart';
import 'package:mkantin/domain/repository/checkout_repostitory.dart';

class CheckoutRepositoryImpl implements CheckoutReppository {
  final FoodLocalDataSource localFoodDataSource;

  CheckoutRepositoryImpl(this.localFoodDataSource);

  @override
  Future<Either<Failure, List<FoodOrder>>> getOrderList() async {
    try {
      final result = await localFoodDataSource.getFoodListOrder();
      return Right(result);
    } on LocalFailure {
      return const Left(LocalFailure('failed load order food'));
    }
  }
}
