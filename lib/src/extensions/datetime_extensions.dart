part of ethller_api_interface;

extension CustomDateTimeExtensions on DateTime {
  int toTruncatedTimeStamp() {
    // ignore: unnecessary_this
    return this.truncateInMinutes().millisecondsSinceEpoch;
  }

  DateTime truncateInMinutes() {
    return DateTime(
      // ignore: unnecessary_this
      this.year,
      // ignore: unnecessary_this
      this.month,
      // ignore: unnecessary_this
      this.day,
      // ignore: unnecessary_this
      this.hour,
      // ignore: unnecessary_this
      this.minute,
    );
  }

  DateTime subtractDays(int days) {
    return DateTime(
      // ignore: unnecessary_this
      this.year,
      // ignore: unnecessary_this
      this.month,
      // ignore: unnecessary_this
      this.day - days,
      // ignore: unnecessary_this
      this.hour,
      // ignore: unnecessary_this
      this.minute,
    );
  }

  DateTime subtractMonths(int months) {
    return DateTime(
      // ignore: unnecessary_this
      this.year,
      // ignore: unnecessary_this
      this.month - months,
      // ignore: unnecessary_this
      this.day,
      // ignore: unnecessary_this
      this.hour,
      // ignore: unnecessary_this
      this.minute,
    );
  }

  DateTime subtractYeras(int years) {
    return DateTime(
      // ignore: unnecessary_this
      this.year - years,
      // ignore: unnecessary_this
      this.month,
      // ignore: unnecessary_this
      this.day,
      // ignore: unnecessary_this
      this.hour,
      // ignore: unnecessary_this
      this.minute,
    );
  }
}