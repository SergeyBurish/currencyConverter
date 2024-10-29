import 'package:currency_converter/features/home/presentation/widgets/double_icon_text_button.dart';
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  final String code;
  final String name;
  final Widget icon;
  final bool selected;
  final void Function()? onPressed;
  const CurrencyListItem({
    super.key, 
    required this.code, 
    required this.name, 
    required this.icon,
    this.selected = false,
    this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return DoubleIconTextButton(
      label: Text(code), 
      icon1: icon,
      icon2: const Icon(Icons.radio_button_unchecked),
      expanded: true,
      bordered: selected, 
      bgColor: selected 
        ? Colors.white 
        : const Color.fromARGB(107, 214, 231, 244),
      onPressed: onPressed,);
  }
}