import 'package:equatable/equatable.dart';
import 'package:mkantin/domain/model/food.dart';

class FoodEntity extends Equatable {
  final int id;
  final String name;
  final int price;
  final String image;
  final int total;

  const FoodEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.total});

  factory FoodEntity.fromModel(Food food, int total) => FoodEntity(
      id: food.id,
      name: food.name,
      price: food.price,
      image: food.image,
      total: total);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'image': image, 'total': total};

  @override
  List<Object?> get props => [id, name, price, image];
}
