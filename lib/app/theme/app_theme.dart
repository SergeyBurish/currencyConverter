import 'package:currency_converter/app/theme/button_styles.dart';
import 'package:currency_converter/app/theme/color_scheme.dart';
import 'package:currency_converter/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData createLightTheme(){
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        const AppColorScheme(
          buttonText:             Color.fromARGB(255, 0, 26, 255),
          messageIcon:            Colors.orange,
          dialogIcon:             Colors.black12,
          dialogIconSelected:     Colors.red,
          messageBackground:      Color.fromARGB(77, 244, 209, 102),
          fromBackground:         Color.fromARGB(51, 72, 164, 240),
          toBackground:           Color.fromARGB(52, 245, 117, 215),
          itemBackground:         Color.fromARGB(107, 214, 231, 244),
          itemBackgroundSelected: Colors.white,
        ),
        const AppTextStyles(
          buttonText: TextStyle(
            fontSize: 14,
          ),
          dialogCurrencyCode: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
          dialogCurrencyName: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const AppButtonStyles(
          dialogButton: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 26, 255)),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),  
        ),
      ],
    );
  }
}

extension BuildContextExtention on BuildContext {
  AppColorScheme get colorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;

  AppTextStyles get textStyles =>
      Theme.of(this).extension<AppTextStyles>()!;

  AppButtonStyles get buttonStyles =>
    Theme.of(this).extension<AppButtonStyles>()!;
}