class Month {
  final int year;
  final int month;
  Month({
    required this.year,
    required this.month,
  });


 factory Month.fromDateTime(DateTime dateTime) {
    return Month(year: dateTime.year, month: dateTime.month);
  }
}
