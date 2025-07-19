import 'package:learn_riverpod/core/exceptions/api_exception.dart';

class ClientException extends ApiException {
  const ClientException(super.message, super.statusCode);

  static ClientException badRequest() =>
      const ClientException('Bad request', 400);

  static ClientException unauthorized() =>
      const ClientException('Unauthorized', 401);

  static ClientException forbidden() => const ClientException('Forbidden', 403);

  static ClientException notFound() => const ClientException('Not found', 404);
}
