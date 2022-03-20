import 'package:frproteses/src/config/local_files.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/provider_local_data_source.dart';
import 'package:frproteses/src/data/repositories/customer_repository_impl.dart';
import 'package:frproteses/src/data/repositories/provider_repository_impl.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';
import 'package:frproteses/src/domain/usecases/customer/index.dart';
import 'package:frproteses/src/domain/usecases/provider/get_provider_all.dart';
import 'package:frproteses/src/domain/usecases/provider/get_provider_by_id.dart';
import 'package:frproteses/src/domain/usecases/provider/get_provider_next_id.dart';
import 'package:frproteses/src/domain/usecases/provider/set_provider.dart';
import 'package:frproteses/src/presentation/stores/customer_store.dart';
import 'package:frproteses/src/presentation/stores/menu_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';
import 'package:frproteses/src/presentation/stores/provider_store.dart';
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
  sl.registerFactory(
    () => CustomerStore(
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => ProviderStore(
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
    ),
  );
}

void _initSrcUseCases() {
  sl.registerLazySingleton(() => GetCustomerAll(sl()));
  sl.registerLazySingleton(() => GetCustomerById(sl()));
  sl.registerLazySingleton(() => SetCustomer(sl()));
  sl.registerLazySingleton(() => GetCustomerNextId(sl()));

  sl.registerLazySingleton(() => GetProviderAll(sl()));
  sl.registerLazySingleton(() => GetProviderById(sl()));
  sl.registerLazySingleton(() => SetProvider(sl()));
  sl.registerLazySingleton(() => GetProviderNextId(sl()));
}

void _initSrcRepositories() {
  sl.registerLazySingleton<ICustomerRepository>(
    () => CustomerRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IProviderRepository>(
    () => ProviderRepositoryImpl(
      localDataSource: sl(),
    ),
  );
}

void _initSrcDataSources() {
  sl.registerLazySingleton<ICustomerLocalDataSource>(
    () => CustomerLocalDataSourceImpl(
      customerFile: getLocalFile(LocalFileType.customerFile),
    ),
  );

  sl.registerLazySingleton<IProviderLocalDataSource>(
    () => ProviderLocalDataSourceImpl(
      providerFile: getLocalFile(LocalFileType.providerFile),
    ),
  );
}

void _initCore() {
  sl.registerLazySingleton(() => InputConverter());
}

void _initExternal() {}
