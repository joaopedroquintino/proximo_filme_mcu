import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proximo_filme_mcu/app/core/utils/formatters.dart';
import 'package:proximo_filme_mcu/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:proximo_filme_mcu/app/features/home/presentation/widgets/marvel_loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeCubit>(context).obterProximoFilme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeError) {
          return Center(
            child: TextButton(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).obterProximoFilme();
              },
              child: Text('Tentar Novamente'),
            ),
          );
        }

        if (state is HomeSuccess) {
          final proximoFilme = state.proximoFilme;

          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).scaffoldBackgroundColor,
              ], stops: [
                0.3,
                1.0,
              ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      proximoFilme.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'Lança em ${proximoFilme.daysUntil} dias',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Image.network(proximoFilme.posterUrl),
                ),
                Text(
                  formatDate(proximoFilme.releaseDate) ?? '',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          );
        }

        return Center(
          child: MarvelLoadingWidget(),
        );
      }),
    );
  }
}
