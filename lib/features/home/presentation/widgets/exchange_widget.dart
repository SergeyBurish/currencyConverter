import 'package:circle_flags/circle_flags.dart';
import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
import 'package:flutter/material.dart';

class ExchangeWidget extends StatefulWidget {
  final String header;
  final String footer;
  final String currencyCode;
  final String countryCode;
  final void Function()? onCountryPressed;
  const ExchangeWidget({
    super.key, 
    required this.header, 
    required this.footer, 
    required this.currencyCode,
    required this.countryCode,
    this.onCountryPressed,});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.header),
        Row(
          children: [
            const Expanded(
              child: TextField()
            ),
            DoubleIconTextButton( 
              icon1: CircleFlag(widget.countryCode, size: 20,),
              label: Text(widget.currencyCode),
              icon2: const Icon(Icons.keyboard_arrow_down),
              onPressed: widget.onCountryPressed,
            ),
          ],
        ),
        Text(widget.footer),
      ],
    );
  }
}