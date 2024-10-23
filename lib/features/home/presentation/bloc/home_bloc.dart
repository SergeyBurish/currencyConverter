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
      String defCurrency = await HomeUsecase.currencyProducer.getDefaultCurrency();
      emit(DefCurrencyState(defCurrency: defCurrency));
    });
  }
}
