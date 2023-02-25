// return format tanggal hari : yyyymmdd
String todaysDateFormatted() {
  // hari ini
  var dateTimeObject = DateTime.now();

  // format hari dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // format bulan mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // format tahun yyyy
  String year = dateTimeObject.year.toString();

  // final format
  String yyyymmdd = year + month + day;
  return yyyymmdd;
}

// convert string yyyymmdd to DateTime object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// convert DateTime object to string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // format tahun yyyy
  String year = dateTime.year.toString();

  // format bulan mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // format hari dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
