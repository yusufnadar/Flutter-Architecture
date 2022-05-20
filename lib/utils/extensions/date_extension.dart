import 'package:intl/intl.dart';

extension DateFormats on DateTime{
  String dateFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
