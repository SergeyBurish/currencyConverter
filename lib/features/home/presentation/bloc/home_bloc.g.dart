// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState selectedCurrency(CurrencyEntity? selectedCurrency);

  HomeState currencies(List<CurrencyEntity> currencies);

  HomeState fromExpression(String fromExpression);

  HomeState toExpression(String toExpression);

  HomeState valueFrom(String valueFrom);

  HomeState valueTo(String valueTo);

  HomeState dialog(bool dialog);

  HomeState dialogFrom(bool dialogFrom);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeState call({
    CurrencyEntity? selectedCurrency,
    List<CurrencyEntity> currencies,
    String fromExpression,
    String toExpression,
    String valueFrom,
    String valueTo,
    bool dialog,
    bool dialogFrom,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHomeState.copyWith(...)` or call `instanceOfHomeState.copyWith.fieldName(value)` for a single field.
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState selectedCurrency(CurrencyEntity? selectedCurrency) =>
      call(selectedCurrency: selectedCurrency);

  @override
  HomeState currencies(List<CurrencyEntity> currencies) =>
      call(currencies: currencies);

  @override
  HomeState fromExpression(String fromExpression) =>
      call(fromExpression: fromExpression);

  @override
  HomeState toExpression(String toExpression) =>
      call(toExpression: toExpression);

  @override
  HomeState valueFrom(String valueFrom) => call(valueFrom: valueFrom);

  @override
  HomeState valueTo(String valueTo) => call(valueTo: valueTo);

  @override
  HomeState dialog(bool dialog) => call(dialog: dialog);

  @override
  HomeState dialogFrom(bool dialogFrom) => call(dialogFrom: dialogFrom);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeState call({
    Object? selectedCurrency = const $CopyWithPlaceholder(),
    Object? currencies = const $CopyWithPlaceholder(),
    Object? fromExpression = const $CopyWithPlaceholder(),
    Object? toExpression = const $CopyWithPlaceholder(),
    Object? valueFrom = const $CopyWithPlaceholder(),
    Object? valueTo = const $CopyWithPlaceholder(),
    Object? dialog = const $CopyWithPlaceholder(),
    Object? dialogFrom = const $CopyWithPlaceholder(),
  }) {
    return HomeState._(
      selectedCurrency: selectedCurrency == const $CopyWithPlaceholder()
          ? _value.selectedCurrency
          // ignore: cast_nullable_to_non_nullable
          : selectedCurrency as CurrencyEntity?,
      currencies:
          currencies == const $CopyWithPlaceholder() || currencies == null
          ? _value.currencies
          // ignore: cast_nullable_to_non_nullable
          : currencies as List<CurrencyEntity>,
      fromExpression:
          fromExpression == const $CopyWithPlaceholder() ||
              fromExpression == null
          ? _value.fromExpression
          // ignore: cast_nullable_to_non_nullable
          : fromExpression as String,
      toExpression:
          toExpression == const $CopyWithPlaceholder() || toExpression == null
          ? _value.toExpression
          // ignore: cast_nullable_to_non_nullable
          : toExpression as String,
      valueFrom: valueFrom == const $CopyWithPlaceholder() || valueFrom == null
          ? _value.valueFrom
          // ignore: cast_nullable_to_non_nullable
          : valueFrom as String,
      valueTo: valueTo == const $CopyWithPlaceholder() || valueTo == null
          ? _value.valueTo
          // ignore: cast_nullable_to_non_nullable
          : valueTo as String,
      dialog: dialog == const $CopyWithPlaceholder() || dialog == null
          ? _value.dialog
          // ignore: cast_nullable_to_non_nullable
          : dialog as bool,
      dialogFrom:
          dialogFrom == const $CopyWithPlaceholder() || dialogFrom == null
          ? _value.dialogFrom
          // ignore: cast_nullable_to_non_nullable
          : dialogFrom as bool,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHomeState.copyWith(...)` or `instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
