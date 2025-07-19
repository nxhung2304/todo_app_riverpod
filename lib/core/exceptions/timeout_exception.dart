
import 'package:learn_riverpod/core/exceptions/api_exception.dart';

class TimeoutException extends ApiException {
  const TimeoutException(super.message);

  static TimeoutException connection() =>
      const TimeoutException('Connection timeout');

  static TimeoutException receive() =>
      const TimeoutException('Receive timeout');

  static TimeoutException send() => const TimeoutException('Send timeout');
}
