import 'package:currency_converter/di/locator.dart';
import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/widgets/converter_view.dart';
import 'package:currency_converter/features/home/presentation/widgets/exchange_rates_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(currencyProducer: Locator.currencyProducer),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(
          'currency_converter_title'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp
          ),
        ),
        leading: const BackButton(),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.redAccent
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    tabs: const [
                      SizedBox(
                        height: 40,
                        child: Center(child: Text("Конвертер")) // L10n
                      ),
                      SizedBox(
                        height: 40,
                        child: Center(child: Text("Курсы валют"))), // L10n
                    ],
                  ),
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                ConverterView(),
                ExchangeRatesView(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
