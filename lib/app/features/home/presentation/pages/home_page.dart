import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${proximoFilme.title} releases in ${proximoFilme.daysUntil} days',
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: Image.network(proximoFilme.posterUrl)),
                Text(proximoFilme.releaseDate)
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
