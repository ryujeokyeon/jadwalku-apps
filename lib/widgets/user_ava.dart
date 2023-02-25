import 'package:flutter/material.dart';

class UserAva extends StatefulWidget {
  const UserAva({super.key});

  @override
  State<UserAva> createState() => _UserAvaState();
}

class _UserAvaState extends State<UserAva> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
      child: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/jeremy.png'),
      ),
    );
  }
}
