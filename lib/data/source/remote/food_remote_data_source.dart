import 'package:mkantin/data/dummy/food_dummy.dart';
import 'package:mkantin/domain/model/food.dart';

abstract class FoodRemoteDataSource {
  Future<List<Food>> fetchFoodList();
}

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  @override
  Future<List<Food>> fetchFoodList() async {
    final dummy = FoodDummy();
    final response =  dummy.generateFoodList();

    return response;
  }
}
