import 'package:dartz/dartz.dart';
import 'package:mkantin/data/common/failure.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/domain/repository/order_repository.dart';

class OrderFoodUseCase {
  final OrderRepository orderRepository;

  OrderFoodUseCase(this.orderRepository);

  Future<Either<Failure, String>> execute(Food food, int total) {
    return orderRepository.orderFood(food, total);
  }

}
