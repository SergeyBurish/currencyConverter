import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme>{
  final Color buttonText;
  final Color messageIcon;
  final Color dialogIcon;
  final Color dialogIconSelected;
  final Color messageBackground;
  final Color fromBackground;
  final Color toBackground;
  final Color itemBackground;
  final Color itemBackgroundSelected;
    
  const AppColorScheme({
    required this.buttonText,
    required this.messageIcon,
    required this.dialogIcon,
    required this.dialogIconSelected,
    required this.messageBackground,
    required this.fromBackground,
    required this.toBackground,
    required this.itemBackground,
    required this.itemBackgroundSelected,
  });

  @override
  AppColorScheme copyWith({
    Color? buttonText,
    Color? messageIcon,
    Color? dialogIcon,
    Color? dialogIconSelected,
    Color? messageBackground,
    Color? fromBackground,
    Color? toBackground,
    Color? itemBackground,
    Color? itemBackgroundSelected,
  }) {
    return AppColorScheme(
      buttonText:             buttonText ?? this.buttonText,
      messageIcon:            messageIcon ?? this.messageIcon,
      dialogIcon:             dialogIcon ?? this.dialogIcon,
      dialogIconSelected:     dialogIconSelected ?? this.dialogIconSelected,
      messageBackground:      messageBackground ?? this.messageBackground,
      fromBackground:         fromBackground ?? this.fromBackground,
      toBackground:           toBackground ?? this.toBackground,
      itemBackground:         itemBackground ?? this.itemBackground,
      itemBackgroundSelected: itemBackgroundSelected ?? this.itemBackgroundSelected,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      buttonText:             Color.lerp(buttonText, other.buttonText, t)!,
      messageIcon:            Color.lerp(messageIcon, other.messageIcon, t)!,
      dialogIcon:             Color.lerp(dialogIcon, other.dialogIcon, t)!,
      dialogIconSelected:     Color.lerp(dialogIconSelected, other.dialogIconSelected, t)!,
      messageBackground:      Color.lerp(messageBackground, other.messageBackground, t)!,
      fromBackground:         Color.lerp(fromBackground, other.fromBackground, t)!,
      toBackground:           Color.lerp(toBackground, other.toBackground, t)!,
      itemBackground:         Color.lerp(itemBackground, other.itemBackground, t)!,
      itemBackgroundSelected: Color.lerp(itemBackgroundSelected, other.itemBackgroundSelected, t)!,
    );  
  }
}