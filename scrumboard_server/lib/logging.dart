import 'package:logger/logger.dart';

// ignore: prefer_function_declarations_over_variables
final logger = (Type type) => Logger(
      printer: CustomerPrinter(type.toString()),
      //Sets the log level to verbose. 
      level: Level.verbose,
    );

class CustomerPrinter extends LogPrinter {
  final String className;

  CustomerPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;

    return [color!('$emoji $className: $message')];
  }
}