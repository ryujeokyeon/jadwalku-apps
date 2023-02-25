import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // reference box
  final _myBox = Hive.box('Todo_Database');

  //  method untuk ketika pertama kali buka aplikasi
  void createInitialData() {
    todoList = [
      ['Jalan Pagi', false],
    ];
  }

  //  load data dari database
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  //  update database
  void updateDatabase() {
    _myBox.put('TODOLIST', todoList);
  }
}
