import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/features/home/presentation/widgets/converter_view.dart';
import 'package:currency_converter/features/home/presentation/widgets/exchange_rates_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerticalView extends StatelessWidget {
  const VerticalView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dm.s40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
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
                tabs: [
                  SizedBox(
                    height: Dm.s40,
                    child: Center(child: Text('converter_title'.tr()))
                  ),
                  SizedBox(
                    height: Dm.s40,
                    child: Center(child: Text('exchange_rates_title'.tr()))
                  ),
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
    );
  }
}