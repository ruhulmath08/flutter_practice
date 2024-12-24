import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlutterSleepChart extends StatefulWidget {
  const FlutterSleepChart({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FlutterSleepChart> createState() => _FlutterSleepChartState();
}

class _FlutterSleepChartState extends State<FlutterSleepChart> {
  @override
  Widget build(BuildContext context) {
    final List<SleepModel> allData = SleepModel.getAllData();
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BarChart(
            BarChartData(
              barGroups: allData
                  .map(
                    (SleepModel sleepModel) => BarChartGroupData(
                      x: sleepModel.id,
                      barRods: [
                        // List of BarChartRodData
                        BarChartRodData(
                          width: 16, // Width of the bar
                          color: _getColor(sleepModel.startTime.hour -
                              sleepModel.endTime.hour),
                          toY: sleepModel.endTime.hour.toDouble(),
                          fromY: sleepModel.startTime.hour.toDouble(),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${allData[value.round()].startTime.day}-${allData[value.round()].endTime.day}',
                        style: TextStyle(fontSize: 10),
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, meta) {
                      return Text(value.round().toString());
                    },
                  ),
                  axisNameSize: 10,
                  drawBelowEverything: true,
                  //axisNameWidget: Text('Hours'),
                ),
              ),
              borderData: FlBorderData(show: true),
              maxY: 24,
              minY: 0,
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int value) {
    print(value);
    if (value >= 10) {
      return Colors.green;
    } else if (value < 10 && value >= 7) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}

class SleepModel {
  final int id;
  final DateTime startTime;
  final DateTime endTime;

  SleepModel({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  static List<SleepModel> getAllData() {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 7));

    List<SleepModel> dataList = [];
    for (int i = 0; i < 7; i++) {
      dataList.add(
        SleepModel(
          id: i,
          startTime: startDate.copyWith(
            //night 10 PM //20, 21, 22, 23
            day: startDate.day + i,
            hour: Random().nextInt(3) + 19,
            minute: 0,
            second: 0,
          ),
          endTime: startDate.copyWith(
            day: (startDate.day + 1) + i,
            hour: Random().nextInt(4) + 11,
            minute: 0,
            second: 0,
          ),
        ),
      );
    }

    return dataList;
  }
}
