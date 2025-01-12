import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/flutter_date_time_picker/widgets/increment_decrement_button.dart';
import 'package:intl/intl.dart';

class DisplayAndChangeDate extends StatelessWidget {
  const DisplayAndChangeDate({
    super.key,
    required this.isDay,
    required this.startDateTime,
    required this.endDateTime,
    required this.onPressDecrementButton,
    required this.onPressIncrementButton,
  });

  final bool isDay;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final VoidCallback onPressDecrementButton;
  final VoidCallback onPressIncrementButton;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final isDisabled =
        endDateTime.isAfter(now) || endDateTime.difference(now).inDays == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IncrementDecrementButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: onPressDecrementButton,
        ),
        Expanded(
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(_buildStartAndEndDate()),
            ),
          ),
        ),
        IncrementDecrementButton(
          onPressed: isDisabled ? null : onPressIncrementButton,
          isDisableButton: isDisabled,
          icon: Icons.arrow_forward_ios,
        ),
      ],
    );
  }

  String _buildStartAndEndDate() {
    return isDay
        ? DateFormat('yyyy-MM-dd').format(endDateTime)
        : '${DateFormat('yyyy-MM-dd').format(startDateTime)} - ${DateFormat('yyyy-MM-dd').format(endDateTime)}';
  }
}
