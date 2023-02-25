import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../constant.dart';

class HabitTile extends StatelessWidget {
  final String habitname;
  final bool habitDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteDitekan;
  final Function(BuildContext)? settingsDitekan;

  const HabitTile({
    super.key,
    required this.habitname,
    required this.habitDone,
    required this.onChanged,
    required this.deleteDitekan,
    required this.settingsDitekan,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        // startActionPane: ,
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // settings option
            SlidableAction(
              onPressed: settingsDitekan,
              backgroundColor: abuabu,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            // opsi hapus / delete options
            SlidableAction(
              onPressed: deleteDitekan,
              backgroundColor: merah,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kuning,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: hitam, width: 3),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: habitDone,
                onChanged: onChanged,
              ),

              // nama habit
              Text(habitname),
            ],
          ),
        ),
      ),
    );
  }
}
