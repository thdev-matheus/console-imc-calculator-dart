class ColorText {
  static String red(String text) => '\x1B[31m$text/x1B[0m';

  static String green(String text) => '\x1B[32m$text/x1B[0m';

  static String yellow(String text) => '\x1B[33m$text/x1B[0m';

  static String blue(String text) => '\x1B[34m$text/x1B[0m';

  static String magenta(String text) => '\x1B[35m$text/x1B[0m';

  static String cyan(String text) => '\x1B[36m$text/x1B[0m';
}
