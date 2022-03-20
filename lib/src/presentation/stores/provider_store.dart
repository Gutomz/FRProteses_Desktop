import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/domain/usecases/provider/index.dart';
import 'package:mobx/mobx.dart';
part 'provider_store.g.dart';

class ProviderStore = _ProviderStoreBase with _$ProviderStore;

abstract class _ProviderStoreBase with Store {
  final InputConverter _inputConverter;
  final GetProviderAll _getAllUseCase;
  final GetProviderById _getByIdUseCase;
  final SetProvider _setUseCase;
  final GetProviderNextId _getNextIdUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _ProviderStoreBase({
    required InputConverter inputConverter,
    required GetProviderAll getAllUseCase,
    required GetProviderById getByIdUseCase,
    required SetProvider setUseCase,
    required GetProviderNextId getNextIdUseCase,
  })  : _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage =
            "Ocorreu um erro ao carregar o arquivo de Fornecedores.";
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
  Future<List<ProviderEntity>?> getAll() async {
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
  Future<ProviderEntity?> getById(String providerId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(providerId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetProviderByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<ProviderEntity?> set(ProviderEntity providerEntity) async {
    _startLoading();
    final options = await _setUseCase(SetProviderParams(providerEntity));
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
