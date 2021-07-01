abstract class ApiResponse {}

class Success extends ApiResponse {
  Success({
    required this.data,
  });

  dynamic data;
}

class Failure extends ApiResponse {
  Failure({
    this.message,
  });

  String? message;
}
