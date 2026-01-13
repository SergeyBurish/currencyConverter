import 'dart:math';

import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/di/injector.dart';
import 'package:currency_converter/features/home/presentation/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  configureDependencies();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'l10n',
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(Dm.designSizeWidth, Dm.designSizeHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        final double screenWidth = min(instance.screenWidth, Dm.maxWidth);
        return fontSize.toDouble() * (screenWidth / Dm.designSizeWidth);
      },
      child: MaterialApp(
        title: 'Currency converter',
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
