import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/domain/usecases/order/index.dart';
import 'package:mobx/mobx.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  final InputConverter _inputConverter;
  final GetOrderAll _getAllUseCase;
  final GetOrderById _getByIdUseCase;
  final SetOrder _setUseCase;
  final GetOrderNextId _getNextIdUseCase;
  final SetOrderClose _setCloseUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _OrderStoreBase({
    required InputConverter inputConverter,
    required GetOrderAll getAllUseCase,
    required GetOrderById getByIdUseCase,
    required SetOrder setUseCase,
    required GetOrderNextId getNextIdUseCase,
    required SetOrderClose setCloseUseCase,
  })  : _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase,
        _setCloseUseCase = setCloseUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage = "Ocorreu um erro ao carregar o arquivo de Pedidos.";
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
  Future<List<OrderEntity>?> getAll() async {
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
  Future<OrderEntity?> getById(String orderId) async {
    _startLoading();
    final conversionOptions = _inputConverter.stringToUnsignedInteger(orderId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetOrderByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<OrderEntity?> set(OrderEntity orderEntity) async {
    _startLoading();
    final options = await _setUseCase(SetOrderParams(orderEntity));
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

  @action
  Future<OrderEntity?> close(int orderId) async {
    _startLoading();
    final options = await _setCloseUseCase(SetOrderCloseParams(orderId));
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
