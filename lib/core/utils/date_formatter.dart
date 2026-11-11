import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String toReadableDate(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String toReadableDateTime(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }

  static String toTimeOnly(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String toApiDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static DateTime? parseApiDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;
    return DateTime.tryParse(dateStr);
  }
}

