import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrencyProducer currencyProducer;
  HomeBloc({required this.currencyProducer})
      : super(HomeInitial()) {

    on<HomeScreenInitEvent>((event, emit) async {
      CurrencyEntity? defCurrency = await currencyProducer.getDefaultCurrency();
      if (defCurrency != null) {
        await currencyProducer.setSelectedCurrencyTo(defCurrency);
        emit(SelectedCurrencyState(selectedCurrency: defCurrency));
      }
    });

    on<CurrenciesListOpenEvent>((event, emit) async {
      await currencyProducer.setValueFrom(event.valueFrom);

      List<CurrencyEntity>? currencies = await currencyProducer.getCurrenciesList();
      if (currencies != null) {
        emit(CurrenciesListState(currencies: currencies));
      }
    });

    on<CurrencyFromSelectedEvent>((event, emit) async {
      await currencyProducer.setSelectedCurrencyFrom(event.selectedCurrencyFrom);
      // emit(SelectedCurrencyState(selectedCurrency: event.selectedCurrencyTo));
    });

    on<CurrencyToSelectedEvent>((event, emit) async {
      await currencyProducer.setSelectedCurrencyTo(event.selectedCurrencyTo);
      emit(SelectedCurrencyState(selectedCurrency: event.selectedCurrencyTo));
    });

    on<ValueFromUpdatedEvent>((event, emit) async {
      String valueTo =await currencyProducer.getValueTo(event.valueFrom);
      emit(ValueToState(value: valueTo));
    });

    on<ValueToUpdatedEvent>((event, emit) async {
      String valueFrom =await currencyProducer.getValueFrom(event.valueTo);
      emit(ValueFromState(value: valueFrom));
    });

    on<RecalculateValueToEvent>((event, emit) async {
      final values = await currencyProducer.recalculateValueTo();
      emit(ValuesFromToState(valueFrom: values.valueFrom, valueTo: values.valueTo));
    });
  }
}
