import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/domain/usecases/product/index.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final InputConverter _inputConverter;
  final GetProductAll _getAllUseCase;
  final GetProductById _getByIdUseCase;
  final SetProduct _setUseCase;
  final GetProductNextId _getNextIdUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _ProductStoreBase({
    required InputConverter inputConverter,
    required GetProductAll getAllUseCase,
    required GetProductById getByIdUseCase,
    required SetProduct setUseCase,
    required GetProductNextId getNextIdUseCase,
  })  : _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage = "Ocorreu um erro ao carregar o arquivo de Produtos.";
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
  Future<List<ProductEntity>?> getAll() async {
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
  Future<ProductEntity?> getById(String providerId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(providerId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetProductByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<ProductEntity?> set(ProductEntity providerEntity) async {
    _startLoading();
    final options = await _setUseCase(SetProductParams(providerEntity));
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
