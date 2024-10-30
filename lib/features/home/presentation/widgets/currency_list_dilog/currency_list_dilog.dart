import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/circle_flag.dart';
import 'package:currency_converter/features/home/presentation/widgets/currency_list_dilog/currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyListDilog extends StatefulWidget {
  const CurrencyListDilog({super.key});

  @override
  State<CurrencyListDilog> createState() => _CurrencyListDilogState();
}

class _CurrencyListDilogState extends State<CurrencyListDilog> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Material( // Wrapping the Text widget in a Material widget will also add a default style to your widget: // https://mixable.blog/flutter-red-text-and-yellow-lines-in-text-widget/
          color: Colors.white,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
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
                    child: ListView.builder(
                      itemCount: state.currencies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CurrencyListItem(
                            code: state.currencies[index].charCode,
                            name: state.currencies[index].name,
                            selected: index == _selectedIndex,
                            icon: CircleFlag(countryCode: state.currencies[index].countryCode,),
                            onPressed: () => setState(() => _selectedIndex = index)
                          )
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(CurrencySelectedEvent(selectedCurrency: state.currencies[_selectedIndex]));
                        context.read<HomeBloc>().add(RecalculateValueToEvent());
                        Navigator.of(context).pop();
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 26, 255)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Применить"), // L10n
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            buildWhen: (previous, current) => current is CurrenciesListState,
          ),
        ),
      ),
    );
  }
}
