import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/features/home/presentation/widgets/circle_flag.dart';
import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeWidget extends StatefulWidget {
  final String footer;
  final String currencyCode;
  final String countryCode;
  final TextEditingController controller;
  final void Function(String)? onValueChanged;
  final void Function()? onCountryPressed;
  const ExchangeWidget({
    super.key, 
    required this.footer, 
    required this.currencyCode,
    required this.countryCode,
    required this.controller,
    this.onValueChanged,
    this.onCountryPressed,});

  @override
  State<ExchangeWidget> createState() => _ExchangeWidgetState();
}

class _ExchangeWidgetState extends State<ExchangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dm.s10,
      children: [
        Row(
          spacing: Dm.s10,
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
                    decoration:const InputDecoration(
                      border: InputBorder.none
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
                    controller: widget.controller,
                    onChanged: widget.onValueChanged,
                  ),
                ),
              )
            ),
            DoubleIconTextButton( 
              icon1: CircleFlag(countryCode: widget.countryCode,),
              label: Text(widget.currencyCode),
              icon2: Icon(
                Icons.keyboard_arrow_down,
                color: widget.onCountryPressed == null ? Colors.grey : null,
              ),
              onPressed: widget.onCountryPressed,
            ),
          ],
        ),
        Text(widget.footer),
      ],
    );
  }
}