import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/usecases/payment/index.dart';
import 'package:frproteses/src/presentation/stores/bank_account_store.dart';
import 'package:mobx/mobx.dart';
part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  final BankAccountStore _bankAccountStore;
  final InputConverter _inputConverter;
  final GetPaymentAll _getAllUseCase;
  final GetPaymentById _getByIdUseCase;
  final SetPayment _setUseCase;
  final GetPaymentNextId _getNextIdUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _PaymentStoreBase({
    required BankAccountStore bankAccountStore,
    required InputConverter inputConverter,
    required GetPaymentAll getAllUseCase,
    required GetPaymentById getByIdUseCase,
    required SetPayment setUseCase,
    required GetPaymentNextId getNextIdUseCase,
  })  : _bankAccountStore = bankAccountStore,
        _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage = "Ocorreu um erro ao carregar o arquivo de Pagamentos.";
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
  Future<List<PaymentEntity>?> getAll() async {
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
  Future<PaymentEntity?> getById(String paymentId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(paymentId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetPaymentByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<PaymentEntity?> set(
    PaymentEntity paymentEntity, {
    bool isNew = false,
  }) async {
    _startLoading();
    final options = await _setUseCase(SetPaymentParams(paymentEntity));

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      _stopLoading();
      return null;
    }

    if (isNew) {
      await _bankAccountStore.pay(
          paymentEntity.customerEntity.id, paymentEntity.value);
    }
    _stopLoading();

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
