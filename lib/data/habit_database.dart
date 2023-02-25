import 'package:hive_flutter/hive_flutter.dart';
import '../datetime/date_time.dart';

// reference box
final _mybox = Hive.box('Habit_Database');

class HabitDatabase {
  List todayHabitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // buat initial dafault data
  void createDefaultData() {
    todayHabitList = [
      ['sarapan', false],
      ['baca', false],
    ];

    _mybox.put('START_DATE', todaysDateFormatted());
  }

  // load data jika sudah ada
  void loadData() {
    // if it's new day, get habit list from database
    if (_mybox.get(todaysDateFormatted()) == null) {
      todayHabitList = _mybox.get('CURRENT_HABIT_LIST');
      for (int i = 0; i < todayHabitList.length; i++) {
        todayHabitList[i][1] == false;
      }
    }
    // if it's not a new day, load list hari ini
    else {
      todayHabitList = _mybox.get(todaysDateFormatted());
    }
  }

  // update database
  void updateDatabase() {
    // update today entry
    _mybox.put(todaysDateFormatted(), todayHabitList);

    // update universe habit list in case it changed (new, edit, delete habir)
    _mybox.put('CURRENT_HABIT_LIST', todayHabitList);

    // calculate habit complete percentages for each day
    calculateHabitPercentages();

    // load heatmap
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < todayHabitList.length; i++) {
      if (todayHabitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = todayHabitList.isEmpty
        ? '0.0'
        : (countCompleted / todayHabitList.length).toStringAsFixed(1);

    // key: "PERCENTAGE_SUMMARY_yyyymmdd"
    // value: string of 1dp number between 0.0-1.0s inclusive
    _mybox.put('PERCENTAGE_SUMMARY_${todaysDateFormatted()}', percent);
  }

  //
  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_mybox.get('START_DATE'));

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" akan digunaka untuk key database ini
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _mybox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? '0.0',
      );

      // split the datatime up like below

      // tahun
      int year = startDate.add(Duration(days: i)).year;

      // bulan
      int month = startDate.add(Duration(days: i)).month;

      // hari
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
