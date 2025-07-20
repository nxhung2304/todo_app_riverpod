import 'package:logger/web.dart';

class AppLogger {
  debug(String msg, {dynamic data}) {
    final Logger logger = Logger();
    if (data != null) {
      logger.d("$msg: $data");
    } else {
      logger.d(msg);
    }
  }

  error(String msg, {dynamic data}) {
    final Logger logger = Logger();
    if (data != null) {
      logger.e("$msg: $data");
    } else {
      logger.e(msg);
    }
  }
  info(String msg, {dynamic data}) {
    final Logger logger = Logger();
    if (data != null) {
      logger.i("$msg: $data");
    } else {
      logger.i(msg);
    }
  }
  warning(String msg, {dynamic data}) {
    final Logger logger = Logger();
    if (data != null) {
      logger.w("$msg: $data");
    } else {
      logger.w(msg);
    }
  }
}
