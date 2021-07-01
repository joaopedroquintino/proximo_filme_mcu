import 'package:proximo_filme_mcu/app/features/common/data/datasources/proximo_filme_datasource.dart';
import 'package:proximo_filme_mcu/app/features/common/data/models/proximo_filme_model.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/entities/proximo_filme_entity.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/repositories/proximo_filme_repository_contract.dart';

class ProximoFilmeRepositoryImpl implements ProximoFilmeRepositoryContract {
  ProximoFilmeRepositoryImpl({
    required IProximoFilmeDatasource proximoFilmeDatasource,
  }) : _datasource = proximoFilmeDatasource;

  IProximoFilmeDatasource _datasource;

  @override
  Future<ProximoFilmeEntity?> buscarProximoFilme() async {
    final map = await _datasource.obterProximoFilme();
    if (map != null) {
      try {
        return ProximoFilmeModel.fromMap(map);
      } catch (e) {}
    }
  }
}
