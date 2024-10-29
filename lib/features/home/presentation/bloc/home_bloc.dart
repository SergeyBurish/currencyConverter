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
        await HomeUsecase.currencyProducer.setSelectedCurrency(defCurrency);
        emit(SelectedCurrencyState(selectedCurrency: defCurrency));
      }
    });

    on<CurrenciesListOpenEvent>((event, emit) async {
      List<CurrencyEntity>? currencies = await HomeUsecase.currencyProducer.getCurrenciesList();
      if (currencies != null) {
        emit(CurrenciesListState(currencies: currencies));
      }
    });

    on<CurrencySelectedEvent>((event, emit) async {
      await HomeUsecase.currencyProducer.setSelectedCurrency(event.selectedCurrency);
      emit(SelectedCurrencyState(selectedCurrency: event.selectedCurrency));
    });

    on<ValueFromUpdatedEvent>((event, emit) async {
      print("on<ValueUpdatedEvent valueFrom ${event.valueFrom}");
      String valueTo =await HomeUsecase.currencyProducer.getValueTo(event.valueFrom);
      print("on<ValueUpdatedEvent valueTo $valueTo");
      emit(ValueToState(value: valueTo));
    });
  }
}
