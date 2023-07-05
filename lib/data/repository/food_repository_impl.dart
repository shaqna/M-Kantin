import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/data/source/remote/food_remote_data_source.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;

  const FoodRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Food>>> fetchFoodList() async {
    try {
      final result = await remoteDataSource.fetchFoodList();
      return Right(result);
    } on RemoteFailure {
      return const Left(RemoteFailure('failed fetch dummy data'));
    }
  }
}
