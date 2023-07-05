import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/presentation/pages/order/bloc/order_bloc.dart';

class OrderPage extends StatelessWidget {
  final Food food;
  final _foodTotalController = TextEditingController();
  OrderPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Form',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.red,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ));
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Food Name',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 0.1,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: food.name,
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusColor: Colors.red),
                readOnly: true,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Price',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 0.1,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: 'Rp.${food.price}',
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusColor: Colors.red),
                readOnly: true,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Category',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 0.1,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: food.category,
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusColor: Colors.red),
                readOnly: true,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Total (Please fill)',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 0.1,
              ),
              TextField(
                controller: _foodTotalController,
                decoration: const InputDecoration(
                    hintText: '0',
                    fillColor: Colors.transparent,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusColor: Colors.red),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<OrderBloc, OrderState>(
                listener: (context, state) {
                  if (state is OrderFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      duration: const Duration(seconds: 1),
                    ));
                  } else if (state is OrderSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      duration: const Duration(seconds: 1),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is OrderLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.red,
                    );
                  }
                  return OutlinedButton.icon(
                    onPressed: () {
                      if (_foodTotalController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please fill order total'),
                          duration: Duration(seconds: 1),
                        ));
                      } else {
                        context.read<OrderBloc>().add(OnOrderingFood(
                            food, int.parse(_foodTotalController.text)));
                      }
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const StadiumBorder(),
                    ),
                    clipBehavior: Clip.hardEdge,
                    label: Text(
                      'Add to cart',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18.0),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
