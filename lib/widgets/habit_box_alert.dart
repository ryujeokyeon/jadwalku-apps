// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_apps/constant.dart';

class AlertHabitBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final VoidCallback onEdit;
  final VoidCallback onBatal;

  const AlertHabitBox({
    Key? key,
    required this.onBatal,
    required this.onEdit,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kuning,
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hitam),
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: biru,
            border: Border.all(color: hitam, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: MaterialButton(
            elevation: 0,
            onPressed: onEdit,
            child: const Text(
              'Edit',
              style: TextStyle(color: putih),
            ),
            color: biru,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: biru,
            border: Border.all(color: hitam, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: MaterialButton(
            elevation: 0,
            onPressed: onBatal,
            child: const Text(
              'Batal',
              style: TextStyle(color: putih),
            ),
            color: biru,
          ),
        ),
      ],
    );
  }
}
