import 'package:learn_riverpod/core/exceptions/app_exception.dart';

abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, [this.statusCode]);

  // Network
  static NetworkException networkNotConnected() =>
      NetworkException.notConnected();
  static NetworkException networkConnectionFailed() =>
      NetworkException.connectionFailed();

  // Timeout
  static TimeoutException timeoutConnection() => TimeoutException.connection();
  static TimeoutException timeoutReceive() => TimeoutException.receive();
  static TimeoutException timeoutSend() => TimeoutException.send();

  // Server
  static ServerException serverError(int code) =>
      ServerException.withCode(code);
  static ServerException serverGeneric(int code) =>
      ServerException.generic(code);

  // Client
  static ClientException badRequest() => ClientException.badRequest();
  static ClientException unauthorized() => ClientException.unauthorized();
  static ClientException forbidden() => ClientException.forbidden();
  static ClientException notFound() => ClientException.notFound();
}
