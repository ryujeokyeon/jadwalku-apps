import 'package:flutter/material.dart';
import 'package:my_apps/constant.dart';
import 'package:my_apps/widgets/button.dart';

// ignore: must_be_immutable
class TodoBoxAlert extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSimpan;
  VoidCallback onBatal;

  TodoBoxAlert({
    super.key,
    required this.controller,
    required this.onSimpan,
    required this.onBatal,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kuning,
      content: Stack(children: [
        Container(
          height: 250,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: putih,
            border: Border.all(color: hitam, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // user input
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'tambah tugas baru',
                ),
              ),

              // tombol simpan dan batal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // tombol simpan
                  Button(text: 'Simpan', onPressed: onSimpan),

                  const SizedBox(width: 8),

                  // tombol batal
                  Button(text: 'Batal', onPressed: onBatal),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
