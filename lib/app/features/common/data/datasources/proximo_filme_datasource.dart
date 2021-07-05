import 'package:proximo_filme_mcu/app/core/network/api_manager.dart';
import 'package:proximo_filme_mcu/app/core/network/api_response.dart';

abstract class IProximoFilmeDatasource {
  Future<Map<String, dynamic>?> obterProximoFilme(String? data);
}

class ProximoFilmeDatasourceImpl implements IProximoFilmeDatasource {
  ProximoFilmeDatasourceImpl(this._apiManager);

  ApiManager _apiManager;

  @override
  Future<Map<String, dynamic>?> obterProximoFilme(String? data) async {
    final response = await _apiManager.get(data != null ? '?date=$data' : '');

    if (response is Success) {
      return response.data as Map<String, dynamic>;
    }
  }
}
