import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Конвертер валют", // L10n
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp
          ),
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
                      style: TextStyle(
                        fontSize: 10.sp
                      ),
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
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: ExchangeWidget(
                header: "Вы получите:", 
                footer: "1 USD = 0.011 RUR",
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