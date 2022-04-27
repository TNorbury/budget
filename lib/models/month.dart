/// A single month for a given year
class Month {
  late final int year;
  late final int month;
  Month({
    required int year,
    required int month,
  }) {
    if (month == 13) {
      this.month = 1;
      this.year = year + 1;
    } else if (month == 0) {
      this.month = 12;
      this.year = year - 1;
    } else {
      this.month = month;
      this.year = year;
    }
  }

  factory Month.fromDateTime(DateTime dateTime) {
    return Month(year: dateTime.year, month: dateTime.month);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Month &&
      other.year == year &&
      other.month == month;
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode;
}
