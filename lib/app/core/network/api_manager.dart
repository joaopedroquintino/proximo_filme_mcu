import 'package:dio/dio.dart';

import 'package:proximo_filme_mcu/app/core/network/api_response.dart';

class ApiManager {
  ApiManager() : _dio = Dio()..options.baseUrl = _baseUrl;

  Dio _dio;

  static const _baseUrl = 'https://www.whenisthenextmcufilm.com/api';

  Future<ApiResponse> get(String path) async {
    try {
      final result = await _dio.get(path);

      if (result.statusCode == null) {
        return Failure(message: 'Houston, we have a problem!');
      }

      if (result.statusCode! >= 200 && result.statusCode! < 400) {
        return Success(
          data: result.data,
        );
      } else {
        return Failure(message: result.statusMessage);
      }
    } catch (e) {
      return Failure(message: 'Houstom, we have a big problem!');
    }
  }
}
