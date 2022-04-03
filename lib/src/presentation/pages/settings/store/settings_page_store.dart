import 'package:frproteses/src/presentation/stores/settings_store.dart';
import 'package:mobx/mobx.dart';
part 'settings_page_store.g.dart';

class SettingsPageStore = _SettingsPageStoreBase with _$SettingsPageStore;

abstract class _SettingsPageStoreBase with Store {
  final SettingsStore settingsStore;

  _SettingsPageStoreBase({required this.settingsStore});

  @observable
  bool _loading = false;

  @action
  void _startLoading() => _loading = true;

  @action
  void _stopLoading() => _loading = false;

  @action
  Future<void> clear() async {
    _startLoading();
    await settingsStore.clear();
    _stopLoading();
  }

  @computed
  bool get isLoading => _loading || settingsStore.isLoading;

  @computed
  bool get hasError => settingsStore.hasError;

  @computed
  String get errorMessage => settingsStore.errorMessage;
}
