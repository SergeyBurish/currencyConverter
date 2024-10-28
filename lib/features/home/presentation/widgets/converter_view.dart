import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
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
              Flexible(
                flex: 8,
                child: SizedBox.expand(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Material( // Wrapping the Text widget in a Material widget will also add a default style to your widget: // https://mixable.blog/flutter-red-text-and-yellow-lines-in-text-widget/
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Выберите валюту", // L10n
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.close)
                                ),
                              ],
                            ),
                            Expanded(
                              child: BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  return ListView.builder(
                                    // padding: const EdgeInsets.all(8),
                                    itemCount: state.currencies.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10),
                                        child: DoubleIconTextButton(
                                          icon1: const Icon(
                                              Icons.flag_outlined),
                                          label: Text(state
                                              .currencies[index].charCode),
                                          icon2: const Icon(
                                              Icons.radio_button_unchecked),
                                          expanded: true,
                                          bgColor: const Color.fromARGB(
                                              107, 214, 231, 244),
                                        ),
                                      );
                                    }
                                  );
                                },
                                buildWhen: (previous, current) => current is CurrenciesListState,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Применить") // L10n
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Конвертер валют", // L10n
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),

        Padding( // 1st block: text
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
                  const Icon(Icons.textsms_outlined, color: Colors.orange,),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: Text(
                      "Все переводы курсов конвертер осуществляет на основе стоимости валют по данным ЦБ РФ",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding( // 2nd block: ru
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(51, 72, 164, 240),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: ExchangeWidget(
                header: "Хочу обменять:", 
                footer: "1 RUR = 90 USD",
              ),
            ),
          ),
        ),

        Padding( // 3rd block: foreign
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(86, 245, 160, 188),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExchangeWidget(
                header: "Вы получите:",
                footer: "1 USD = 0.011 RUR",
                onCountryPressed: () => showCountriesDoalog(context),
              ),
            ),
          ),
        ),
        Center(child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text("Default Currency: ${state.defCurrency}");
          },
          buildWhen: (previous, current) => current is DefCurrencyState,
        )),
      ],
    );
  }
}
