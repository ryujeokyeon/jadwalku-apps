import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_apps/constant.dart';
import 'package:my_apps/data/todo_database.dart';
import '../widgets/todo_box_alert.dart';
import '../widgets/todo_tile.dart';
import 'menu_page_habit.dart';

class MenuPageTodo extends StatefulWidget {
  const MenuPageTodo({super.key});

  @override
  State<MenuPageTodo> createState() => _MenuPageTodoState();
}

class _MenuPageTodoState extends State<MenuPageTodo> {
  // reference Hive box
  final _myBox = Hive.box('Todo_Database');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // pertama kali buka aplikasi, buat data default
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // datanya udah ada
      db.loadData();
    }

    super.initState();
  }

  // teks controller
  final _controller = TextEditingController();

// listview DiCheck
  void listChecked(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  // buat task baru
  void buatTaskBaru() {
    showDialog(
      context: context,
      builder: (context) {
        return TodoBoxAlert(
          controller: _controller,
          onSimpan: simpanTugasBaru,
          onBatal: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // hapus tugas
  void hapusTugas(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  // simpan tugas baru
  void simpanTugasBaru() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: biru,
      appBar: AppBar(
        title: const Text('Selamat Datang!'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
      ),
      body: Stack(
        children: [
          Container(
            width: ukuran.width,
            height: ukuran.height,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: hitam, width: 3),
              color: putih,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: ListView(
              children: [
                Column(
                  children: [
                    // -------------menu calendar-------------
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          height: 160,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MenuPageHabit();
                                },
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kuning,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: hitam, width: 3),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Image.asset(
                                    'assets/calendar.png',
                                    fit: BoxFit.fill,
                                    width: 100,
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    'Cek\nProduktivitas',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ----------menu calendar END------------
                    Container(
                      padding: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Hari Ini',
                            style: TextStyle(
                              color: hitam,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(width: 18),

                          // button tambah tugas baru
                          ElevatedButton(
                            onPressed: buatTaskBaru,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: biru,
                                side: BorderSide(color: hitam, width: 2),
                                shape: const CircleBorder()),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),

                    // listView db.todoList
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 350,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: db.todoList.length,
                          itemBuilder: (context, index) {
                            return TodoTile(
                              taskName: db.todoList[index][0],
                              taskDone: db.todoList[index][1],
                              onChanged: (value) => listChecked(value, index),
                              hapusFunction: (context) => hapusTugas(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
