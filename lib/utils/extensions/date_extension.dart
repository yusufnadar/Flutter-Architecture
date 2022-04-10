import 'package:intl/intl.dart';

extension DateFormats on DateTime{
  dateFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
