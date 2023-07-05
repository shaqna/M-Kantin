import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/utils/category.dart';

class FoodDummy {
  List<Food> generateFoodList() {
    final foodList = [
      Food(
          id: 1,
          name: 'Nasi Goreng Telur',
          price: 10000,
          image: 'assets/nasi_goreng.jpg',
          category: Category.rice),
      Food(
          id: 2,
          name: 'Sate Ayam',
          price: 10000,
          image: 'assets/sate.jpeg',
          category: Category.fitters),
      Food(
          id: 3,
          name: 'Nasi Ayam Penyet',
          price: 13000,
          image: 'assets/nasi_ayam_penyet.jpeg',
          category: Category.rice),
       Food(
          id: 4,
          name: 'Kentang Goreng',
          price: 10000,
          image: 'assets/kentang_goreng.jpeg',
          category: Category.fitters),
       Food(
          id: 5,
          name: 'Omelet',
          price: 10000,
          image: 'assets/omelet.jpeg',
          category: Category.fitters)
    ];

    return foodList;
  }
}
