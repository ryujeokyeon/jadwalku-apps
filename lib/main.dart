import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  await Hive.initFlutter();

  // open a box
  // ignore: unused_local_variable
  var boxTodo = await Hive.openBox('Todo_Database');
  // ignore: unused_local_variable
  var boxHabit = await Hive.openBox('Habit_Database');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const Scaffold(body: SplashScreen()),
    );
  }
}
