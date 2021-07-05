import 'package:proximo_filme_mcu/app/features/common/domain/entities/proximo_filme_entity.dart';
import 'package:proximo_filme_mcu/app/features/common/domain/repositories/proximo_filme_repository_contract.dart';

class BuscarProximoFilmeUsecase {
  BuscarProximoFilmeUsecase({
    required ProximoFilmeRepositoryContract proximoFilmeRepository,
  }) : _repository = proximoFilmeRepository;

  ProximoFilmeRepositoryContract _repository;

  Future<ProximoFilmeEntity?> call(String? data) async {
    return _repository.buscarProximoFilme(data);
  }
}
