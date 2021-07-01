import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/entities/proximo_filme_entity.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/usecases/buscar_proximo_filme_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required BuscarProximoFilmeUsecase buscarProximoFilmeUsecase,
  })  : _buscarProximoFilmeUsecase = buscarProximoFilmeUsecase,
        super(HomeLoading());

  BuscarProximoFilmeUsecase _buscarProximoFilmeUsecase;

  Future<void> obterProximoFilme() async {
    emit(HomeLoading());

    final proximoFilme = await _buscarProximoFilmeUsecase();

    if (proximoFilme == null) {
      emit(
        HomeError(),
      );
    } else {
      emit(
        HomeSuccess(proximoFilme: proximoFilme),
      );
    }
  }
}
