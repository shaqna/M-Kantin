import 'package:mkantin/data/common/exception.dart';
import 'package:mkantin/data/models/food_entity.dart';
import 'package:mkantin/data/source/db/database_helper.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/model/food_order.dart';

abstract class FoodLocalDataSource {
  Future<String> insertFoodOrder(Food food, int total);
  Future<List<FoodOrder>> getFoodListOrder();
}

class FoodLocalDataSourceImpl implements FoodLocalDataSource {
  final DatabaseHelper database;

  FoodLocalDataSourceImpl(this.database);

  @override
  Future<List<FoodOrder>> getFoodListOrder() async {
    try {
      final result = await database.fetchFoodListOrder();
      return result.map((e) => FoodOrder.fromEntity(e)).toList();
    } on DatabaseException {
      throw DatabaseException('something wrong in database');
    }
  }

  @override
  Future<String> insertFoodOrder(Food food, int total) async {
    try {
      await database.insertFoodOrder(FoodEntity.fromModel(food, total));
      return "Order success. Please wait a minute";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
