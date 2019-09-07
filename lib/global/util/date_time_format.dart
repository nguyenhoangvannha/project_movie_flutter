import 'package:intl/intl.dart';

class DateTimeFormat {
  static String format(int min) {
    return DateFormat("Hms", "en_US").format(DateTime(0, 0, 0, 0, min));
  }
}
