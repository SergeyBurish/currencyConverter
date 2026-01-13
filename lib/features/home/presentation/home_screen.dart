import 'package:currency_converter/app/dm.dart';
import 'package:currency_converter/di/locator.dart';
import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:currency_converter/features/home/presentation/layout/vertical.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(currencyProducer: Locator.currencyProducer),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: Text(
          'currency_converter_title'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        centerTitle: false,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: Dm.s10, horizontal: Dm.s15),
        child: VerticalView()
        // child: MediaQuery.of(context).size.width > Dm.narrowWidth ? 
        //     const HorizontalView() : const VerticalView()
      ),
    );
  }
}
