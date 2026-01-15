import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/circle_flag.dart';
import 'package:currency_converter/features/home/presentation/widgets/currency_list_dilog/currency_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyListDilog extends StatefulWidget {
  final bool from;
  const CurrencyListDilog({super.key, required this.from});

  @override
  State<CurrencyListDilog> createState() => _CurrencyListDilogState();
}

class _CurrencyListDilogState extends State<CurrencyListDilog> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Dm.maxWidth),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            color: Colors.white,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen:(previous, current) => 
                !listEquals(previous.currencies, current.currencies),
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'select_currency'.tr(),
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
                      padding: const EdgeInsets.only(top: Dm.s10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.from) {
                            context.read<HomeBloc>().add(CurrencyFromSelectedEvent(selectedCurrencyFrom: state.currencies[_selectedIndex]));
                          } else {
                            context.read<HomeBloc>().add(CurrencyToSelectedEvent(selectedCurrencyTo: state.currencies[_selectedIndex]));
                          }
                          context.read<HomeBloc>().add(RecalculateValueToEvent());
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 0, 26, 255)),
                          foregroundColor: const WidgetStatePropertyAll(Colors.white),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: Dm.s20.w)),
                        ),
                        child: Text('apply'.tr()),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
