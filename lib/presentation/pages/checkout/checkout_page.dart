import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mkantin/presentation/pages/checkout/bloc/checkout_bloc.dart';
import 'package:mkantin/presentation/widgets/order_cart.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => context.read<CheckoutBloc>().add(OnFetchCheckoutItem()));
  }

  @override
  Widget build(BuildContext context) {
    var items = 0;
    var total = 0;

    return Scaffold(
        appBar: AppBar(
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/baner_resto.jpg',
            fit: BoxFit.fitWidth,
            height: 100,
            width: double.infinity,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'Checkout',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: const Divider(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else if (state is CheckoutError) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(state.message),
                    ));
              } else if (state is CheckoutHasData) {
                items = state.foodOrder.length;
                for (var element in state.foodOrder) {
                  total += element.price!;
                }
                return Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: state.foodOrder.length,
                        itemBuilder: (context, index) {
                          return OrderCart(foodOrder: state.foodOrder[index]);
                        }),
                  ),
                );
              } else if (state is CheckoutEmpty) {
                return const Center(
                  child: Text(
                    'Belum ditambah',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'Failed',
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: const Divider(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutHasData) {
                var total = 0;
                for (var element in state.foodOrder) {
                  total += element.price!;
                }
                return Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Expanded(child: Text('Items:${state.foodOrder.length}')),
                      Expanded(
                        child: Text('Total:  Rp.$total'),
                      )
                    ],
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: const Row(
                  children: [
                    Expanded(child: Text('Items:0')),
                    Expanded(
                      child: Text('Total:  Rp.0'),
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              'Payment',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              margin: const EdgeInsets.only(left: 4),
              child: ListTile(
                title: const Text('m-Card (NFC Card)'),
                leading: Radio(
                    value: 'm-card',
                    groupValue: 'm-card',
                    onChanged: (value) {}),
              )),
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () {
                  Widget okButton = OutlinedButton(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: const Text(
                      "Transaksi Berhasil",
                      style: TextStyle(color: Colors.green),
                    ),
                    content: const Text("Silahkan order lagi."),
                    actions: [
                      okButton,
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                icon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const StadiumBorder(),
                ),
                clipBehavior: Clip.hardEdge,
                label: Text(
                  'Bayar',
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          )
        ]));
  }
}
