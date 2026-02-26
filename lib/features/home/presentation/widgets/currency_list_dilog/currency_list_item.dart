import 'package:currency_converter/app/theme/app_theme.dart';
import 'package:currency_converter/app/theme/color_scheme.dart';
import 'package:currency_converter/app/theme/text_styles.dart';
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
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = context.textStyles;
    final AppColorScheme colorScheme = context.colorScheme;
    return DoubleIconTextButton(
      label: RichText(text: 
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: code,
              style: textStyles.dialogCurrencyCode,
            ),
            TextSpan(
              text: ' / $name',
              style: textStyles.dialogCurrencyName,
            )
          ]
        ),
      ), 
      icon1: icon,
      icon2: selected 
        ? Icon(Icons.trip_origin, color: colorScheme.dialogIconSelected,)
        : Icon(Icons.panorama_fish_eye, color: colorScheme.dialogIcon,),
      expanded: true,
      bordered: selected, 
      bgColor: selected 
        ? colorScheme.itemBackgroundSelected
        : colorScheme.itemBackground,
      onPressed: onPressed,
    );
  }
}