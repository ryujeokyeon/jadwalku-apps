import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../constant.dart';
import '../datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        datasets: datasets,
        colorMode: ColorMode.color,
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 100)),
        size: 30,
        textColor: putih,
        fontSize: 14,
        showColorTip: false,
        showText: true,
        scrollable: true,
        colorsets: const {
          1: Color.fromARGB(20, 254, 228, 64),
          2: Color.fromARGB(40, 254, 228, 64),
          3: Color.fromARGB(60, 254, 228, 64),
          4: Color.fromARGB(80, 254, 228, 64),
          5: Color.fromARGB(100, 254, 228, 64),
          6: Color.fromARGB(120, 254, 228, 64),
          7: Color.fromARGB(150, 254, 228, 64),
          8: Color.fromARGB(180, 254, 228, 64),
          9: Color.fromARGB(220, 254, 228, 64),
          10: Color.fromARGB(255, 254, 228, 64),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
