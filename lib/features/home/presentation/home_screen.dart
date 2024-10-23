import 'package:currency_converter/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeScreenInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("HomeScreen title"),
      ),
      body: Center(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Text("Default Currency: ${state.defCurrency}");
        },
        buildWhen: (previous, current) => current is DefCurrencyState,
      )),
    );
  }
}
