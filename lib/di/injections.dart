import 'package:get_it/get_it.dart';
import 'package:mkantin/data/repository/checkout_repository_impl.dart';
import 'package:mkantin/data/repository/food_repository_impl.dart';
import 'package:mkantin/data/repository/order_repository_impl.dart';
import 'package:mkantin/data/source/db/database_helper.dart';
import 'package:mkantin/data/source/local/food_local_data_source.dart';
import 'package:mkantin/data/source/remote/food_remote_data_source.dart';
import 'package:mkantin/domain/repository/checkout_repostitory.dart';
import 'package:mkantin/domain/repository/food_repository.dart';
import 'package:mkantin/domain/repository/order_repository.dart';
import 'package:mkantin/domain/usecase/get_list_checkout.dart';
import 'package:mkantin/domain/usecase/get_list_food.dart';
import 'package:mkantin/domain/usecase/order_food_use_case.dart';
import 'package:mkantin/presentation/pages/checkout/bloc/checkout_bloc.dart';
import 'package:mkantin/presentation/pages/home/bloc/category_bloc.dart';
import 'package:mkantin/presentation/pages/home/bloc/food_bloc.dart';
import 'package:mkantin/presentation/pages/login/bloc/login_bloc.dart';
import 'package:mkantin/presentation/pages/order/bloc/order_bloc.dart';

final locator = GetIt.instance;

void initBloc() {
  locator.registerFactory(() => FoodBloc(locator()));
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => CategoryBloc());
  locator.registerFactory(() => OrderBloc(locator()));
  locator.registerFactory(() => CheckoutBloc(locator()));
}

void initUseCase() {
  locator.registerLazySingleton(() => GetListFood(locator()));
  locator.registerLazySingleton(() => OrderFoodUseCase(locator()));
  locator.registerLazySingleton(() => GetListCheckout(locator()));
}

void initRepository() {
  locator.registerLazySingleton<FoodRepository>(
      () => FoodRepositoryImpl(locator()));
  locator.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(locator()));
  locator.registerLazySingleton<CheckoutReppository>(() => CheckoutRepositoryImpl(locator()));
}

void initDataSource() {
  locator.registerLazySingleton<FoodRemoteDataSource>(
      () => FoodRemoteDataSourceImpl());

  locator.registerLazySingleton<FoodLocalDataSource>(
      () => FoodLocalDataSourceImpl(locator()));
}

void initDb() {
  locator.registerLazySingleton(() => DatabaseHelper());
}
