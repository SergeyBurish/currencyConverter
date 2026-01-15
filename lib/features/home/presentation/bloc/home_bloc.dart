import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrencyProducer currencyProducer;
  HomeBloc({required this.currencyProducer})
      : super(HomeState.initial()) {

    on<HomeScreenInitEvent>((event, emit) async {
      CurrencyEntity? defCurrency = await currencyProducer.getDefaultCurrency();
      if (defCurrency != null) {
        await currencyProducer.setSelectedCurrencyTo(defCurrency);
        emit(state.copyWith(
          selectedCurrency: defCurrency,
          fromExpression: defCurrency.fromRUR,
          toExpression: defCurrency.toRUR,
        ));
      }
    });

    on<CurrenciesListOpenEvent>((event, emit) async {
      if (event.dialog) {
        emit(state.copyWith(
          dialog: true,
          dialogFrom: event.dialogFrom,
        ));
        emit(state.copyWith.dialog(false));
      }
      List<CurrencyEntity>? currencies = await currencyProducer.getCurrenciesList();
      if (currencies != null) {
        emit(state.copyWith.currencies(currencies));
      }
    });

    on<CurrencyFromSelectedEvent>((event, emit) async {
      await currencyProducer.setSelectedCurrencyFrom(event.selectedCurrencyFrom);
    });

    on<CurrencyToSelectedEvent>((event, emit) async {
      await currencyProducer.setSelectedCurrencyTo(event.selectedCurrencyTo);
      emit(state.copyWith(
        selectedCurrency: event.selectedCurrencyTo,
        fromExpression: event.selectedCurrencyTo.fromRUR,
        toExpression: event.selectedCurrencyTo.toRUR,
      ));
    });

    on<ValueFromUpdatedEvent>((event, emit) async {
      String valueTo =await currencyProducer.getValueTo(event.valueFrom);
      emit(state.copyWith(
        valueFrom: event.valueFrom,
        valueTo: valueTo,
      ));
    });

    on<ValueToUpdatedEvent>((event, emit) async {
      String valueFrom =await currencyProducer.getValueFrom(event.valueTo);
      emit(state.copyWith(
        valueTo: event.valueTo,
        valueFrom: valueFrom,
      ));
    });

    on<RecalculateValueToEvent>((event, emit) async {
      final valueTo = await currencyProducer.getValueTo(state.valueFrom);
      emit(state.copyWith.valueTo(valueTo));
      emit(state.copyWith(
        valueFrom: state.valueFrom,
        valueTo: valueTo,
      ));
    });
  }
}
