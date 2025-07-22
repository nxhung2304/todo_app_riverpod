
import 'package:learn_riverpod/core/exceptions/api_exception.dart';

class ServerException extends ApiException {
  const ServerException(super.message, super.statusCode);

  static ServerException withCode(int statusCode) =>
      ServerException('Server error: $statusCode', statusCode);

  static ServerException generic(int statusCode) =>
      ServerException('Server error occurred', statusCode);
}
