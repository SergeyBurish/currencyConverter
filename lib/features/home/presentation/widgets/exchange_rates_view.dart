import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/circle_flag.dart';
import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRatesView extends StatefulWidget {
  const ExchangeRatesView({super.key});

  @override
  State<ExchangeRatesView> createState() => _ExchangeRatesViewState();
}

class _ExchangeRatesViewState extends State<ExchangeRatesView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(CurrenciesListOpenEvent(valueFrom: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.currencies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: DoubleIconTextButton(
                icon1: CircleFlag(countryCode: state.currencies[index].countryCode,),
                label: Text("${state.currencies[index].charCode}: ${state.currencies[index].value}${state.currencies[index].nominal > 1 ? " за ${state.currencies[index].nominal}" : ""}"),
                expanded: true,
                bgColor: const Color.fromARGB(107, 214, 231, 244),
              ),
            );
          }
        );
      },
      buildWhen: (previous, current) => current is CurrenciesListState,
    );
  }
}
