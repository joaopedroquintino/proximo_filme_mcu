import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proximo_filme_mcu/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:proximo_filme_mcu/app/features/home/presentation/pages/home_page.dart';
import 'package:proximo_filme_mcu/app/injection_container.dart';

void main() {
  initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Próximo Filme UCM',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => di<HomeCubit>(),
        child: HomePage(),
      ),
    );
  }
}
