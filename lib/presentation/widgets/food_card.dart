import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mkantin/domain/model/food.dart';

class FoodCard extends StatelessWidget {
  final String username;
  final Food food;
  const FoodCard({super.key, required this.food, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          context.goNamed('order_page',
              extra: food, pathParameters: {'username': username});
        },
        child: Container(
          margin: EdgeInsets.zero,
          child: Card(
            semanticContainer: true,
            child: Container(
              margin: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        food.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    food.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Rp.${food.price}',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
