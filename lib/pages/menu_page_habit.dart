import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_apps/constant.dart';
import 'package:my_apps/data/habit_database.dart';
import 'package:my_apps/widgets/month_summary.dart';
import '../widgets/habit_tile.dart';
import '../widgets/habit_box_alert.dart';

class MenuPageHabit extends StatefulWidget {
  const MenuPageHabit({super.key});

  @override
  State<MenuPageHabit> createState() => _MenuPageHabitState();
}

class _MenuPageHabitState extends State<MenuPageHabit> {
  HabitDatabase db = HabitDatabase();
  final _mybox = Hive.box('Habit_Database');

  @override
  void initState() {
    // jika tidak ada list kegiatan sebelumnya, for the first time
    // buat default data
    if (_mybox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();
    }
    // udah ada kegiatan sebelumnya, not the first time
    else {
      db.loadData();
    }

    // update database
    db.updateDatabase();

    super.initState();
  }

  // checkbox ditekan
  void checkBoxDitekan(bool? value, int index) {
    setState(() {
      db.todayHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  // buat habit baru
  final _newHabitNameController = TextEditingController();
  void buatHabitbaru() {
    // alert doalog
    showDialog(
      context: context,
      builder: (context) {
        return AlertHabitBox(
          controller: _newHabitNameController,
          onEdit: simpanNewHabit,
          onBatal: batalDialogBox,
          hintText: 'nama kegiatan',
        );
      },
    );
  }

  // simpan new Habit
  void simpanNewHabit() {
    // tambah habit hari ini
    setState(() {
      db.todayHabitList.add([_newHabitNameController.text, false]);
    });
    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  // batal new habit
  void batalDialogBox() {
    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertHabitBox(
          controller: _newHabitNameController,
          onEdit: () => simpanExistingHabit(index),
          onBatal: batalDialogBox,
          hintText: db.todayHabitList[index][0],
        );
      },
    );
  }

  //  simpan existing habit
  void simpanExistingHabit(int index) {
    setState(() {
      db.todayHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // hapus habit
  void hapusHabit(int index) {
    setState(() {
      db.todayHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: biru,
      body: SizedBox(
        width: ukuran.width,
        height: ukuran.height,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // monthly summary
                  child: MonthlySummary(
                    datasets: db.heatMapDataSet,
                    startDate: _mybox.get('START_DATE'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'ayo produktif',
                      style: TextStyle(
                        color: putih,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 18),

                    // button tambah
                    ElevatedButton(
                      onPressed: buatHabitbaru,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: biru,
                          side: BorderSide(color: hitam, width: 2),
                          shape: const CircleBorder()),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todayHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitname: db.todayHabitList[index][0],
                  habitDone: db.todayHabitList[index][1],
                  onChanged: (value) => checkBoxDitekan(value, index),
                  deleteDitekan: (context) => hapusHabit(index),
                  settingsDitekan: (context) => openHabitSettings(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
