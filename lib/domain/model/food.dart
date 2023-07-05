import 'package:equatable/equatable.dart';

import '../../utils/category.dart';

class Food extends Equatable {
  final int id;
  final String name;
  final int price;
  final String image;
  String category = Category.all;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category
  });



  @override
  List<Object> get props => [];
}
