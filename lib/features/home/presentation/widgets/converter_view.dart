import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/currency_list_dilog/currency_list_dilog.dart';
import 'package:currency_converter/features/home/presentation/widgets/exchange_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  String _valueFrom = '';

  void showCountriesDoalog(BuildContext context, {required bool from}) {
    context.read<HomeBloc>().add(CurrenciesListOpenEvent(valueFrom: _valueFrom));
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (bc, ania, anis) {
        return BlocProvider<HomeBloc>.value(
          value: context.read<HomeBloc>(),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 8,
                child: SizedBox.expand(
                  child: CurrencyListDilog(from: from),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeScreenInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dm.s10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(77, 244, 209, 102),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    spacing: Dm.s10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.textsms_outlined,
                        color: Colors.orange,
                      ),
                      Flexible(
                        child: Text(
                          'conversions_message'.tr(),
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(51, 72, 164, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, valState) {
                      return ExchangeWidget(
                        footer: state.fromExpression,
                        currencyCode: 'RUR',
                        countryCode: 'RU',
                        text: valState.valueFrom,
                        onValueChanged: (val) {
                          _valueFrom = val;
                          context.read<HomeBloc>().add(ValueFromUpdatedEvent(valueFrom: val));
                        },
                        onCountryPressed: () => showCountriesDoalog(context, from: true),
                      );
                    },
                    buildWhen: (previous, current) => current is ValueFromState || current is ValuesFromToState,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(52, 245, 117, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, valState) {
                      return ExchangeWidget(
                        footer: state.toExpression,
                        currencyCode: state.selectedCurrency?.charCode ?? 'Not Set',
                        countryCode: state.selectedCurrency?.countryCode ?? 'Not Set',
                        text: valState.valueTo,
                        onValueChanged: (val) => context.read<HomeBloc>().add(ValueToUpdatedEvent(valueTo: val)),
                        onCountryPressed: () => showCountriesDoalog(context, from: false),
                      );
                    },
                    buildWhen: (previous, current) => current is ValueToState || current is ValuesFromToState,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      buildWhen: (previous, current) => current is SelectedCurrencyState,
    );
  }
}
