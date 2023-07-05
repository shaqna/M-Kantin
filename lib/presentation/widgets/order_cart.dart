import 'package:flutter/material.dart';
import 'package:mkantin/domain/model/food_order.dart';

class OrderCart extends StatelessWidget {
  final FoodOrder foodOrder;

  const OrderCart({super.key, required this.foodOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            foodOrder.image ?? 'assets/baner_resto.jps',
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(
                    foodOrder.name ?? '-',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Total: ${foodOrder.total}',
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            )),
        Expanded(
          flex: 2,
          child: Center(child: Text('Rp.${foodOrder.price}')),
        )
      ]),
    );
  }
}
