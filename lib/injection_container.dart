import 'package:frproteses/src/presentation/stores/menu_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  _initSrcFeature();

  //! Core
  _initCore();

  //! External
  _initExternal();
}

void _initSrcFeature() {
  // Stores - Factory
  _initSrcStores();

  // Use cases - Lazy Singleton
  _initSrcUseCases();

  // Repositories - Lazy Singleton
  _initSrcRepositories();

  // Data Sources - Lazy Singleton
  _initSrcDataSources();
}

void _initSrcStores() {
  sl.registerLazySingleton(() => MenuStore());
  sl.registerLazySingleton(() => NavigationStore());
}

void _initSrcUseCases() {}

void _initSrcRepositories() {}

void _initSrcDataSources() {}

void _initCore() {}

void _initExternal() {}
