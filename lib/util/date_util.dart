class DateUtil {
  static String dateToString(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";
  }

  static bool pastDate(DateTime date) {
    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    return currentDate.compareTo(date) > 0 ? true : false;
  }
}
