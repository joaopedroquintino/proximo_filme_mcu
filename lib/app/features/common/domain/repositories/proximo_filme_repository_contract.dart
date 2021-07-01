import 'package:proximo_filme_mcu/app/features/common/domain/entities/proximo_filme_entity.dart';

abstract class ProximoFilmeRepositoryContract {
  Future<ProximoFilmeEntity?> buscarProximoFilme();
}
