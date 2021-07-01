import 'package:get_it/get_it.dart';
import 'package:proximo_filme_mcu/app/core/network/api_manager.dart';
import 'package:proximo_filme_mcu/app/features/common/data/datasources/proximo_filme_datasource.dart';
import 'package:proximo_filme_mcu/app/features/common/data/repositories/proximo_filme_repository_impl.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/repositories/proximo_filme_repository_contract.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/usecases/buscar_proximo_filme_usecase.dart';
import 'package:proximo_filme_mcu/app/features/home/presentation/cubit/home_cubit.dart';

GetIt di = GetIt.I;

void initDependencies() {
  di.registerLazySingleton(
    () => ApiManager(),
  );

  di.registerLazySingleton<IProximoFilmeDatasource>(
    () => ProximoFilmeDatasourceImpl(
      di(),
    ),
  );

  di.registerLazySingleton<ProximoFilmeRepositoryContract>(
    () => ProximoFilmeRepositoryImpl(
      proximoFilmeDatasource: di(),
    ),
  );

  di.registerLazySingleton(
    () => BuscarProximoFilmeUsecase(
      proximoFilmeRepository: di(),
    ),
  );

  di.registerFactory(
    () => HomeCubit(
      buscarProximoFilmeUsecase: di(),
    ),
  );
}
