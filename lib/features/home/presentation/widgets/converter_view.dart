import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/currency_list_dilog/currency_list_dilog.dart';
import 'package:currency_converter/features/home/presentation/widgets/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {

  void showCountriesDoalog(BuildContext context) {
    context.read<HomeBloc>().add(CurrenciesListOpenEvent());
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
              const Flexible(
                flex: 8,
                child: SizedBox.expand(
                  child: CurrencyListDilog(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Конвертер валют", // L10n
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Padding(
              // 1st block: text
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(77, 244, 209, 102),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.textsms_outlined,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "Все переводы курсов конвертер осуществляет на основе стоимости валют по данным ЦБ РФ", // L10n
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              // 2nd block: ru
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(51, 72, 164, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ExchangeWidget(
                    header: "Хочу обменять:",
                    footer: state.selectedCurrency?.fromRUR ?? "Not Set",
                    currencyCode: 'RUR',
                    countryCode: 'RU',
                  ),
                ),
              ),
            ),
            Padding(
              // 3rd block: foreign
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(52, 245, 117, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExchangeWidget(
                    header: "Вы получите:",
                    footer: state.selectedCurrency?.toRUR ?? "Not Set",
                    currencyCode: state.selectedCurrency?.charCode ?? "Not Set",
                    countryCode: state.selectedCurrency?.countryCode ?? "us",
                    inputEnabled: false,
                    onCountryPressed: () => showCountriesDoalog(context),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      buildWhen: (previous, current) => current is SelectedCurrencyState,
    );
  }
}
