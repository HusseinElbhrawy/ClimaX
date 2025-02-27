import 'dart:developer';

final ColorLogger kLogger = ColorLogger();

class ColorLogger {
  //! Singleton pattern for single instance usage
  static final ColorLogger _instance = ColorLogger._internal();

  factory ColorLogger() {
    return _instance;
  }

  ColorLogger._internal();

  // !ANSI color codes map
  static const _colorCodes = {
    'black': '\x1B[30m',
    'red': '\x1B[31m',
    'green': '\x1B[32m',
    'yellow': '\x1B[33m',
    'blue': '\x1B[34m',
    'magenta': '\x1B[35m',
    'cyan': '\x1B[36m',
    'white': '\x1B[37m',
  };

  //! General method for printing with color
  void _log(String message, {String color = 'white'}) {
    final colorCode = _colorCodes[color.toLowerCase()] ?? _colorCodes['white'];
    log('$colorCode$message\x1B[0m',
        name: 'ColorLogger'); //! \x1B[0m resets color
  }

  //! Specific methods for each color for convenience
  void black(String message) => _log(message, color: 'black');
  void red(String message) => _log("❌ $message", color: 'red');
  void green(String message) => _log("✅ $message", color: 'green');
  void yellow(String message) => _log(message, color: 'yellow');
  void blue(String message) => _log(message, color: 'blue');
  void magenta(String message) => _log(message, color: 'magenta');
  void cyan(String message) => _log(message, color: 'cyan');
  void white(String message) => _log(message, color: 'white');
}
