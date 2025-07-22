import 'package:learn_riverpod/core/exceptions/api_exception.dart';

class NetworkException extends ApiException {
  const NetworkException(super.message);

  static NetworkException notConnected() =>
      const NetworkException('Not connected with network');

  static NetworkException connectionFailed() =>
      const NetworkException('Connection failed');
}
