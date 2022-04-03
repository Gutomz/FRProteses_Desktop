// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsPageStore on _SettingsPageStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_SettingsPageStoreBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_SettingsPageStoreBase.hasError'))
          .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_SettingsPageStoreBase.errorMessage'))
          .value;

  final _$_loadingAtom = Atom(name: '_SettingsPageStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$clearAsyncAction = AsyncAction('_SettingsPageStoreBase.clear');

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$_SettingsPageStoreBaseActionController =
      ActionController(name: '_SettingsPageStoreBase');

  @override
  void _startLoading() {
    final _$actionInfo = _$_SettingsPageStoreBaseActionController.startAction(
        name: '_SettingsPageStoreBase._startLoading');
    try {
      return super._startLoading();
    } finally {
      _$_SettingsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _stopLoading() {
    final _$actionInfo = _$_SettingsPageStoreBaseActionController.startAction(
        name: '_SettingsPageStoreBase._stopLoading');
    try {
      return super._stopLoading();
    } finally {
      _$_SettingsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage}
    ''';
  }
}
