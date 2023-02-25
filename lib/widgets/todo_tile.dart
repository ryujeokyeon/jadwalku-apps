import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../constant.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? hapusFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
    required this.hapusFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      // package untuk slidable
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: hapusFunction,
              icon: Icons.delete,
              backgroundColor: merah,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: biru,
            border: Border.all(color: hitam, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // untuk ceklis todoList
              Checkbox(
                value: taskDone,
                onChanged: onChanged,
                activeColor: biru,
              ),
              // text name default
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 16,
                    color: putih,
                    decoration: taskDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
