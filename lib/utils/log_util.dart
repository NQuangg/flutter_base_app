import 'package:logger/logger.dart';

import '../flavors/build_config.dart';
import '../flavors/environment.dart';

class LogUtil {
  LogUtil._();

  static final _instance = Logger(
    filter: _CustomLogFilter(),
    printer: PrettyPrinter(printTime: true),
  );

  static void debug(dynamic message) {
    _instance.d(message);
  }

  static void error(dynamic message) {
    _instance.e(message);
  }
}

class _CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return BuildConfig.instance.environment == Environment.DEVELOPMENT;
  }
}
