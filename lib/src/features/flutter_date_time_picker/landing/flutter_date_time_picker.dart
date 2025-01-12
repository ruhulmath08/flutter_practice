import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/flutter_date_time_picker/widgets/flutter_period_selector.dart';
import 'package:flutter_practice/src/features/flutter_date_time_picker/widgets/period_selector_enum.dart';

class FlutterDateTimePicker extends StatelessWidget {
  const FlutterDateTimePicker({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            FlutterPeriodSelector(
              enumValues: const [
                PeriodSelectorEnum.day,
                PeriodSelectorEnum.week,
                PeriodSelectorEnum.month,
                PeriodSelectorEnum.year,
              ],
              onSelectPeriod: (PeriodSelectorEnum value) {
                print('Period: $value');
              },
              onChangeDateTime: (startDateTime, endDateTime){
                print('StartDateTime: $startDateTime - EndDateTime: $endDateTime');
              },
            ),
          ],
        ),
      ),
    );
  }
}
