import 'package:currency_converter/features/home/presentation/widgets/circle_flag.dart';
import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeWidget extends StatefulWidget {
  final String header;
  final String footer;
  final String currencyCode;
  final String countryCode;
  final bool inputEnabled;
  final void Function()? onCountryPressed;
  const ExchangeWidget({
    super.key, 
    required this.header, 
    required this.footer, 
    required this.currencyCode,
    required this.countryCode,
    this.inputEnabled = true,
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
        const SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    enabled: widget.inputEnabled,
                    decoration:const InputDecoration(
                      border: InputBorder.none
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
                  ),
                ),
              )
            ),
            const SizedBox(width: 10,),
            DoubleIconTextButton( 
              icon1: CircleFlag(countryCode: widget.countryCode,),
              label: Text(widget.currencyCode),
              icon2: const Icon(Icons.keyboard_arrow_down),
              onPressed: widget.onCountryPressed,
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Text(widget.footer),
      ],
    );
  }
}