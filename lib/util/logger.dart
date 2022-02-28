import 'package:logger/logger.dart';

Logger getLogger<T>() {
  return Logger(printer: _AppLoggerPrinter(T));
}

class _AppLoggerPrinter extends LogPrinter {
  final Type classType;
  _AppLoggerPrinter(this.classType);
  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    return [color!('$emoji <$classType> ${event.message}')];
  }
}
