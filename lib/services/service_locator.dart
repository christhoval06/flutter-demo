import 'package:get_it/get_it.dart';

import 'drawer/drawer_service.dart';
import 'currency/currency_service.dart';
import 'web_api/web_api.dart';
import 'storage/storage_service.dart';

import 'currency/currency_service_implementation.dart';
import 'storage/storage_service_implementation.dart';
import 'web_api/web_api_implementation.dart';
import 'drawer/drawer_service_implementation.dart';

import 'package:moolax/logics/view_models/calculate_screen_viewmodel.dart';
import 'package:moolax/logics/view_models/choose_favorites_viewmodel.dart';
import 'package:moolax/logics/view_models/drawer_viewmodel.dart';

// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  serviceLocator
      .registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator
      .registerLazySingleton<DrawerService>(() => DrawerServiceImpl());
  serviceLocator
      .registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());

  // You can replace the actual services above with fake implementations during development.
  //
  // serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());
  // serviceLocator.registerLazySingleton<StorageService>(() => FakeStorageService());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());

  // view models
  serviceLocator.registerFactory<CalculateScreenViewModel>(
      () => CalculateScreenViewModel());
  serviceLocator.registerFactory<ChooseFavoritesViewModel>(
      () => ChooseFavoritesViewModel());
  serviceLocator.registerFactory<DrawerViewModel>(() => DrawerViewModel());
}
