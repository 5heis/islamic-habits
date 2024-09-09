import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../datetime/date_time.dart';

class MonthlySummary extends StatefulWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    Key? key,
    required this.datasets,
    required this.startDate,
  }) : super(key: key);

  @override
  _MonthlySummaryState createState() => _MonthlySummaryState();
}

class _MonthlySummaryState extends State<MonthlySummary> {
  late StreamController<double> _consistencyController;
  int _currentStreak = 0;
  int _longestStreak = 0;

  @override
  void initState() {
    super.initState();
    _consistencyController = StreamController<double>();
    updateConsistency();
  }

  void updateConsistency() {
    double consistency = calculateConsistency();
    _consistencyController.add(consistency);
  }

  double calculateConsistency() {
    if (widget.datasets == null || widget.datasets!.isEmpty) {
      resetStreak();
      return 0.0; // No data available, consistency is 0%
    }

    int totalDays = DateTime.now()
            .difference(createDateTimeObject(widget.startDate))
            .inDays +
        1;

    int completedDays = widget.datasets!.keys.length;
    if (completedDays == totalDays) {
      // Update streaks only when all days are completed
      updateStreaks();
    } else {
      // Reset streaks if any day is missed
      resetStreak();
    }

    return (completedDays / totalDays) * 100.0;
  }

  void updateStreaks() {
    _currentStreak++;
    if (_currentStreak > _longestStreak) {
      _longestStreak = _currentStreak;
    }
  }

  void resetStreak() {
    _currentStreak = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          HeatMap(
            startDate: createDateTimeObject(widget.startDate),
            endDate: DateTime.now().add(const Duration(days: 0)),
            datasets: widget.datasets,
            colorMode: ColorMode.color,
            defaultColor: Colors.grey[200],
            textColor: Theme.of(context).colorScheme.secondary,
            showText: true,
            scrollable: true,
            size: 30,
            colorsets: const {
              1: Color.fromARGB(20, 2, 179, 8),
              2: Color.fromARGB(40, 2, 179, 8),
              3: Color.fromARGB(60, 2, 179, 8),
              4: Color.fromARGB(80, 2, 179, 8),
              5: Color.fromARGB(100, 2, 179, 8),
              6: Color.fromARGB(120, 2, 179, 8),
              7: Color.fromARGB(150, 2, 179, 8),
              8: Color.fromARGB(180, 2, 179, 8),
              9: Color.fromARGB(220, 2, 179, 8),
              10: Color.fromARGB(255, 2, 179, 8),
            },
          ),
          const SizedBox(height: 10),
          // StreamBuilder<double>(
          //   stream: _consistencyController.stream,
          //   initialData: 0.0,
          //   builder: (context, snapshot) {
          //     return Column(
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               'Consistency: ',
          //               style: TextStyle(
          //                   color: Theme.of(context).colorScheme.secondary,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //             Text(
          //               '${snapshot.data?.toStringAsFixed(2) ?? '0.0'}%',
          //               style: TextStyle(
          //                   color: Colors.green,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(height: 8),
          //         Row(
          //           children: [
          //             Text(
          //               'Current Streak: ',
          //               style: TextStyle(
          //                   color: Theme.of(context).colorScheme.secondary,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //             Text(
          //               '$_currentStreak days',
          //               style: TextStyle(
          //                   color: Colors.green,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Text(
          //               'Longest Streak: ',
          //               style: TextStyle(
          //                   color: Theme.of(context).colorScheme.secondary,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //             Text(
          //               '$_longestStreak days',
          //               style: TextStyle(
          //                   color: Colors.green,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14),
          //             ),
          //           ],
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _consistencyController.close();
    super.dispose();
  }
}
