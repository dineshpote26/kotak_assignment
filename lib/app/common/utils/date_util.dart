import 'package:intl/intl.dart';

class DateUtil {
  const DateUtil._();

  static String convertEpochToMonth(DateTime? dateTime) {
    if (dateTime == null) return "";
    return DateFormat.yMMMEd()
        .add_Hm()
        .format(dateTime.toLocal())
        .toUpperCase();
  }
}
