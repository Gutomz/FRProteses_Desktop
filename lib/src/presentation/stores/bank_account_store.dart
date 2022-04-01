import 'package:frproteses/src/core/errors/failure.dart';
import 'package:frproteses/src/core/usecases/usecases.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/core/utils/input_converter.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/usecases/bank_account/index.dart';
import 'package:mobx/mobx.dart';
part 'bank_account_store.g.dart';

class BankAccountStore = _BankAccountStoreBase with _$BankAccountStore;

abstract class _BankAccountStoreBase with Store {
  final InputConverter _inputConverter;
  final GetBankAccountAll _getAllUseCase;
  final GetBankAccountById _getByIdUseCase;
  final GetBankAccountByCustomerId _getByCustomerIdUseCase;
  final SetBankAccount _setUseCase;
  final GetBankAccountNextId _getNextIdUseCase;
  final PayBankAccount _payUseCase;
  final ChargeBankAccount _chargeUseCase;
  final ReportBankAccount _reportUseCase;

  @observable
  String _errorMessage = "";

  @observable
  bool _loading = false;

  _BankAccountStoreBase({
    required InputConverter inputConverter,
    required GetBankAccountAll getAllUseCase,
    required GetBankAccountById getByIdUseCase,
    required GetBankAccountByCustomerId getByCustomerIdUseCase,
    required SetBankAccount setUseCase,
    required GetBankAccountNextId getNextIdUseCase,
    required PayBankAccount payUseCase,
    required ChargeBankAccount chargeUseCase,
    required ReportBankAccount reportUseCase,
  })  : _inputConverter = inputConverter,
        _getAllUseCase = getAllUseCase,
        _getByIdUseCase = getByIdUseCase,
        _getByCustomerIdUseCase = getByCustomerIdUseCase,
        _setUseCase = setUseCase,
        _getNextIdUseCase = getNextIdUseCase,
        _payUseCase = payUseCase,
        _chargeUseCase = chargeUseCase,
        _reportUseCase = reportUseCase;

  @action
  void _setErrorMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        _errorMessage =
            "Ocorreu um erro ao carregar o arquivo de Contas Bancárias.";
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
  Future<List<BankAccountEntity>?> getAll() async {
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
  Future<BankAccountEntity?> getById(String bankAccountId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(bankAccountId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByIdUseCase(
      GetBankAccountByIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<BankAccountEntity?> getByCustomerId(String customerId) async {
    _startLoading();
    final conversionOptions =
        _inputConverter.stringToUnsignedInteger(customerId);

    if (conversionOptions.isLeft()) {
      _setErrorMessage(conversionOptions.asLeft());
      _stopLoading();
      return null;
    }

    final options = await _getByCustomerIdUseCase(
      GetBankAccountByCustomerIdParams(conversionOptions.asRight()),
    );
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
      return null;
    }

    return options.asRight();
  }

  @action
  Future<BankAccountEntity?> set(BankAccountEntity bankAccountEntity) async {
    _startLoading();
    final options = await _setUseCase(SetBankAccountParams(bankAccountEntity));
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
  Future<void> pay(int customerId, double amount) async {
    _startLoading();
    final options = await _payUseCase(PayBankAccountParams(customerId, amount));
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
    }
  }

  @action
  Future<void> charge(int customerId, double amount) async {
    _startLoading();
    final options =
        await _chargeUseCase(ChargeBankAccountParams(customerId, amount));
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
    }
  }

  @action
  Future<void> report(int customerId) async {
    _startLoading();
    final options = await _reportUseCase(ReportBankAccountParams(customerId));
    _stopLoading();

    if (options.isLeft()) {
      _setErrorMessage(options.asLeft());
    }
  }

  @computed
  bool get isLoading => _loading;

  @computed
  bool get hasError => !isLoading && _errorMessage.isNotEmpty;

  @computed
  String get errorMessage => _errorMessage;
}
