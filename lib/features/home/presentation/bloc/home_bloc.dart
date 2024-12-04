import 'package:currency_converter/features/home/domain/entity/currency_entity.dart';
import 'package:currency_converter/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeScreenInitEvent>((event, emit) async {
      CurrencyEntity? defCurrency = await HomeUsecase.currencyProducer.getDefaultCurrency();
      if (defCurrency != null) {
        await HomeUsecase.currencyProducer.setSelectedCurrencyTo(defCurrency);
        emit(SelectedCurrencyState(selectedCurrency: defCurrency));
      }
    });

    on<CurrenciesListOpenEvent>((event, emit) async {
      await HomeUsecase.currencyProducer.setValueFrom(event.valueFrom);

      List<CurrencyEntity>? currencies = await HomeUsecase.currencyProducer.getCurrenciesList();
      if (currencies != null) {
        emit(CurrenciesListState(currencies: currencies));
      }
    });

    on<CurrencyFromSelectedEvent>((event, emit) async {
      await HomeUsecase.currencyProducer.setSelectedCurrencyFrom(event.selectedCurrencyFrom);
      // emit(SelectedCurrencyState(selectedCurrency: event.selectedCurrencyTo));
    });

    on<CurrencyToSelectedEvent>((event, emit) async {
      await HomeUsecase.currencyProducer.setSelectedCurrencyTo(event.selectedCurrencyTo);
      emit(SelectedCurrencyState(selectedCurrency: event.selectedCurrencyTo));
    });

    on<ValueFromUpdatedEvent>((event, emit) async {
      String valueTo =await HomeUsecase.currencyProducer.getValueTo(event.valueFrom);
      emit(ValueToState(value: valueTo));
    });

    on<ValueToUpdatedEvent>((event, emit) async {
      String valueFrom =await HomeUsecase.currencyProducer.getValueFrom(event.valueTo);
      emit(ValueFromState(value: valueFrom));
    });

    on<RecalculateValueToEvent>((event, emit) async {
      final values = await HomeUsecase.currencyProducer.recalculateValueTo();
      emit(ValuesFromToState(valueFrom: values.valueFrom, valueTo: values.valueTo));
    });
  }
}
