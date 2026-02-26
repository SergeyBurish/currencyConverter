import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles>{
  final TextStyle buttonText;
  final TextStyle dialogCurrencyCode;
  final TextStyle dialogCurrencyName;
    
  const AppTextStyles({
    required this.buttonText,
    required this.dialogCurrencyCode,
    required this.dialogCurrencyName,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? buttonText,
    TextStyle? dialogCurrencyCode,
    TextStyle? dialogCurrencyName,
  }) {
    return AppTextStyles(
      buttonText: buttonText ?? this.buttonText,
      dialogCurrencyCode: dialogCurrencyCode ?? this.dialogCurrencyCode,
      dialogCurrencyName: dialogCurrencyName ?? this.dialogCurrencyName,
    );  
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) return this;
    return AppTextStyles(
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t)!,
      dialogCurrencyCode: TextStyle.lerp(dialogCurrencyCode, other.dialogCurrencyCode, t)!,
      dialogCurrencyName: TextStyle.lerp(dialogCurrencyName, other.dialogCurrencyName, t)!,
    );
  }
}