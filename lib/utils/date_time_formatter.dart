class DateTimeFormatter {

  // needed to manually format because the format isn't known to
  // intl date formatter
  static DateTime convertFromYYYYMMDD(String data) {
    try {
      final splitted = data.split('-');
      final year = splitted[0];
      final yearInt = int.parse(year);

      var month = splitted[1];
      if (month.startsWith('0')) {
        month = month[1];
      }
      final monthInt = int.parse(month);

      var date = splitted[2];
      if (date.startsWith('0')) {
        date = date[1];
      }
      final dateInt = int.parse(date);
      return DateTime(yearInt, monthInt, dateInt);
    } catch (ex) {
      return DateTime(1970);
    }
  }

  static String convertToYYYYMMDD(DateTime data) {
    try {
      final year = data.year.toString();
      var month = data.month.toString();
      if (month.length == 1) {
        month = '0$month';
      }
      var date = data.day.toString();
      if (date.length == 1) {
        date = '0$date';
      }
      return '$year-$month-$date';
    } catch (ex) {
      return '-';
    }
  }
}
