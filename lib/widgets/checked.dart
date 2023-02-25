import 'package:flutter/material.dart';
import 'package:my_apps/constant.dart';

// widget untuk capaian target
class DiCheck extends StatefulWidget {
  const DiCheck({super.key});

  @override
  State<DiCheck> createState() => _DiCheckState();
}

class _DiCheckState extends State<DiCheck> {
  String selectedDone = 'done';
  String selectedUnDone = 'undone';

  void onChangeDone(String done) {
    selectedDone = done;
    setState(() {});
  }

  void onChangeUnDone(String undone) {
    selectedUnDone = undone;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onChangeDone("done");
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kuning,
            ),
            child: selectedDone == 'done'
                ? const Icon(
                    Icons.check_circle,
                    color: kuning,
                    size: 30,
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
