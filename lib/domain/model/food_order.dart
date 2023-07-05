import 'package:equatable/equatable.dart';

class FoodOrder extends Equatable {
  final int? id;
  final String? name;
  final int? price;
  final String? image;
  final String? category;
  final int? total;

  const FoodOrder(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.category,
      required this.total});

  factory FoodOrder.fromEntity(Map<String, dynamic> entity) => FoodOrder(
      id: entity['id'],
      name: entity['name'],
      price: entity['price'],
      image: entity['image'],
      category: entity['category'],
      total: entity['total']);

  @override
  List<Object> get props => [];
}
