import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mkantin/di/injections.dart' as di;
import 'package:mkantin/domain/model/food.dart';
import 'package:mkantin/presentation/pages/checkout/bloc/checkout_bloc.dart';
import 'package:mkantin/presentation/pages/checkout/checkout_page.dart';
import 'package:mkantin/presentation/pages/home/bloc/category_bloc.dart';
import 'package:mkantin/presentation/pages/home/bloc/food_bloc.dart';
import 'package:mkantin/presentation/pages/home/home_page.dart';
import 'package:mkantin/presentation/pages/login/bloc/login_bloc.dart';
import 'package:mkantin/presentation/pages/login/login_page.dart';
import 'package:mkantin/presentation/pages/order/bloc/order_bloc.dart';
import 'package:mkantin/presentation/pages/order/order_page.dart';

class MKantinApp extends StatelessWidget {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'login_page',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
          path: '/home/:username',
          name: 'home_page',
          builder: (context, state) {
            final username = state.pathParameters['username']!;
            return HomePage(username: username);
          },
          routes: [
            GoRoute(
              path: 'order',
              name: 'order_page',
              builder: (context, state) {
                final Food food = state.extra as Food;
                return OrderPage(key: state.pageKey, food: food);
              },
            ),
            GoRoute(
              path: 'checkout',
              name: 'checkout_page',
              builder: (context, state) {
                return const CheckoutPage();
              },
            ),
          ]),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
  );

  const MKantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<FoodBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<LoginBloc>(),
        ),
        BlocProvider(create: (context) => di.locator<CategoryBloc>()),
        BlocProvider(create: (context) => di.locator<OrderBloc>()),
        BlocProvider(create: (context) => di.locator<CheckoutBloc>())
      ],
      child: MaterialApp.router(
        theme: ThemeData(primarySwatch: Colors.purple),
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
