import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/usecases/customer/index.dart';
import 'package:mobx/mobx.dart';
part 'customer_store.g.dart';

class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  final InputConverter _inputConverter;
  final GetCustomerAll _getAllUseCase;
  final GetCustomerById _getByIdUseCase;
  final SetCustomer _setUseCase;
  final GetCustomerNextId _getNextIdUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _CustomerStoreBase({
    required InputConverter inputConverter,
    required GetCustomerAll getAllUseCase,
    required GetCustomerById getByIdUseCase,
    required SetCustomer setUseCase,
    required GetCustomerNextId getNextIdUseCase,
  })  : _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage = "Ocorreu um erro ao carregar o arquivo de Clientes.";
        break;
      default:
        _errorMessage = "Ocorreu um erro inesperado.";
        break;
    }
  }

  @action
  void _startLoading() => _loading = true;

  @action
  void _stopLoading() => _loading = false;

  @action
  Future<List<CustomerEntity>?> getAll() async {
    _startLoading();
    final options = await _getAllUseCase(NoParams());
    _stopLoading();

    if (options.isRight()) {
      return options.asRight();
    }

    _setErrorMessage(options.asLeft());
    return null;
  }

  @action
  Future<CustomerEntity?> getById(String customerId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(customerId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetCustomerByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<CustomerEntity?> set(CustomerEntity customerEntity) async {
    _startLoading();
    final options = await _setUseCase(SetCustomerParams(customerEntity));
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<int?> getNextId() async {
    _startLoading();
    final options = await _getNextIdUseCase(NoParams());
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @computed
  bool get isLoading => _loading;

  @computed
  bool get hasError => !isLoading && _errorMessage.isNotEmpty;

  @computed
  String get errorMessage => _errorMessage;
}
