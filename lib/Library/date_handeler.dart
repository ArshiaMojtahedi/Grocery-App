import 'package:intl/intl.dart';

String dateConvert(DateTime date) {
  // print(dates);
  return DateFormat.yMMMMd().format(date);
}
