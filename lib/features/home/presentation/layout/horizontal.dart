import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/features/home/presentation/widgets/converter_view.dart';
import 'package:currency_converter/features/home/presentation/widgets/exchange_rates_view.dart';
import 'package:flutter/material.dart';

class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Dm.maxWidth),
        child: const Row(
          spacing: Dm.s10,
          children: [
            Expanded(
              child: ConverterView()
            ),
            Expanded(
              child: ExchangeRatesView()
            ),
          ],
        ),
      ),
    );
  }
}