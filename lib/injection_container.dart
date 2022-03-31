import 'package:frproteses/src/config/local_files.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/data/datasources/local/bank_account_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/customer_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/order_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/payment_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/product_local_data_source.dart';
import 'package:frproteses/src/data/datasources/local/provider_local_data_source.dart';
import 'package:frproteses/src/data/repositories/bank_account_repository_impl.dart';
import 'package:frproteses/src/data/repositories/customer_repository_impl.dart';
import 'package:frproteses/src/data/repositories/order_repository_impl.dart';
import 'package:frproteses/src/data/repositories/payment_repository_impl.dart';
import 'package:frproteses/src/data/repositories/product_repository_impl.dart';
import 'package:frproteses/src/data/repositories/provider_repository_impl.dart';
import 'package:frproteses/src/domain/repositories/bank_account_repository.dart';
import 'package:frproteses/src/domain/repositories/customer_repository.dart';
import 'package:frproteses/src/domain/repositories/order_repository.dart';
import 'package:frproteses/src/domain/repositories/payment_repository.dart';
import 'package:frproteses/src/domain/repositories/product_repository.dart';
import 'package:frproteses/src/domain/repositories/provider_repository.dart';
import 'package:frproteses/src/domain/usecases/bank_account/index.dart';
import 'package:frproteses/src/domain/usecases/customer/index.dart';
import 'package:frproteses/src/domain/usecases/order/index.dart';
import 'package:frproteses/src/domain/usecases/payment/index.dart';
import 'package:frproteses/src/domain/usecases/product/index.dart';
import 'package:frproteses/src/domain/usecases/provider/index.dart';
import 'package:frproteses/src/presentation/stores/bank_account_store.dart';
import 'package:frproteses/src/presentation/stores/customer_store.dart';
import 'package:frproteses/src/presentation/stores/menu_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';
import 'package:frproteses/src/presentation/stores/order_store.dart';
import 'package:frproteses/src/presentation/stores/payment_store.dart';
import 'package:frproteses/src/presentation/stores/product_store.dart';
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

  sl.registerFactory(
    () => ProductStore(
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => PaymentStore(
      bankAccountStore: sl(),
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => OrderStore(
      bankAccountStore: sl(),
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
      setCloseUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => BankAccountStore(
      inputConverter: sl(),
      getAllUseCase: sl(),
      getByIdUseCase: sl(),
      setUseCase: sl(),
      getNextIdUseCase: sl(),
      payUseCase: sl(),
      chargeUseCase: sl(),
      reportUseCase: sl(),
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

  sl.registerLazySingleton(() => GetProductAll(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  sl.registerLazySingleton(() => SetProduct(sl()));
  sl.registerLazySingleton(() => GetProductNextId(sl()));

  sl.registerLazySingleton(() => GetPaymentAll(sl()));
  sl.registerLazySingleton(() => GetPaymentById(sl()));
  sl.registerLazySingleton(() => SetPayment(sl()));
  sl.registerLazySingleton(() => GetPaymentNextId(sl()));

  sl.registerLazySingleton(() => GetOrderAll(sl()));
  sl.registerLazySingleton(() => GetOrderById(sl()));
  sl.registerLazySingleton(() => SetOrder(sl()));
  sl.registerLazySingleton(() => GetOrderNextId(sl()));
  sl.registerLazySingleton(() => SetOrderClose(sl()));

  sl.registerLazySingleton(() => GetBankAccountAll(sl()));
  sl.registerLazySingleton(() => GetBankAccountById(sl()));
  sl.registerLazySingleton(() => SetBankAccount(sl()));
  sl.registerLazySingleton(() => GetBankAccountNextId(sl()));
  sl.registerLazySingleton(() => PayBankAccount(sl()));
  sl.registerLazySingleton(() => ChargeBankAccount(sl()));
  sl.registerLazySingleton(() => ReportBankAccount(sl()));
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

  sl.registerLazySingleton<IProductRepository>(
    () => ProductRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IPaymentRepository>(
    () => PaymentRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IOrderRepository>(
    () => OrderRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IBankAccountRepository>(
    () => BankAccountRepositoryImpl(
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

  sl.registerLazySingleton<IProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(
      productFile: getLocalFile(LocalFileType.productFile),
    ),
  );

  sl.registerLazySingleton<IPaymentLocalDataSource>(
    () => PaymentLocalDataSourceImpl(
      paymentFile: getLocalFile(LocalFileType.paymentFile),
      customerLocalDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IOrderLocalDataSource>(
    () => OrderLocalDataSourceImpl(
      orderFile: getLocalFile(LocalFileType.orderFile),
      customerLocalDataSource: sl(),
      productLocalDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IBankAccountLocalDataSource>(
    () => BankAccountLocalDataSourceImpl(
      bankAccountFile: getLocalFile(LocalFileType.bankAccountFile),
      customerLocalDataSource: sl(),
    ),
  );
}

void _initCore() {
  sl.registerLazySingleton(() => InputConverter());
}

void _initExternal() {}
