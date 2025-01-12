import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/flutter_date_time_picker/widgets/display_and_change_date.dart';
import 'package:flutter_practice/src/features/flutter_date_time_picker/widgets/period_selector_enum.dart';

// ignore: must_be_immutable
class FlutterPeriodSelector extends StatefulWidget {
  FlutterPeriodSelector({
    super.key,
    required this.enumValues,
    this.selectedValue,
    required this.onSelectPeriod,
    required this.onChangeDateTime,
  });

  final List<PeriodSelectorEnum> enumValues;
  PeriodSelectorEnum? selectedValue;
  final Function(PeriodSelectorEnum enumValue) onSelectPeriod;
  final Function(DateTime, DateTime) onChangeDateTime;

  @override
  State<FlutterPeriodSelector> createState() => _FlutterPeriodSelectorState();
}

class _FlutterPeriodSelectorState extends State<FlutterPeriodSelector> {
  late PeriodSelectorEnum _selectedValue;

  late DateTime _startDateTime;
  late DateTime _endDateTime;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue ?? widget.enumValues.first;
    _startDateTime = DateTime.now().subtract(const Duration(days: 7));
    _endDateTime = DateTime.now(); //last date
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
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
          child: DropdownButton<PeriodSelectorEnum>(
            underline: const SizedBox(),
            value: _selectedValue,
            onChanged: (PeriodSelectorEnum? value) {
              setState(() {
                _selectedValue = value!;
                widget.onSelectPeriod(value);
                _onChangedPeriod();
              });
            },
            items: widget.enumValues.map((PeriodSelectorEnum enumValue) {
              return DropdownMenuItem<PeriodSelectorEnum>(
                value: enumValue,
                child: Text(
                  enumValue.name.replaceFirst(
                      enumValue.name[0], enumValue.name[0].toUpperCase()),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: DisplayAndChangeDate(
            isDay: _selectedValue == PeriodSelectorEnum.day,
            startDateTime: _startDateTime,
            endDateTime: _endDateTime,
            onPressIncrementButton: () => _onPressIncrementButton(),
            onPressDecrementButton: () => _onPressDecrementButton(),
          ),
        )
      ],
    );
  }

  void _onPressIncrementButton() {
    setState(
      () {
        DateTime now = DateTime.now();

        switch (_selectedValue) {
          case PeriodSelectorEnum.day:
            // Increment by 1 day
            DateTime newStart = _startDateTime.add(const Duration(days: 1));
            DateTime newEnd = _endDateTime.add(const Duration(days: 1));
            if (newEnd.isBefore(now) || newEnd.isAtSameMomentAs(now)) {
              _startDateTime = newStart;
              _endDateTime = newEnd;
            }
            break;

          case PeriodSelectorEnum.week:
            // Increment by 1 week
            DateTime newStart = _startDateTime.add(const Duration(days: 7));
            DateTime newEnd = _endDateTime.add(const Duration(days: 7));
            if (_endDateTime.isBefore(now) ||
                _endDateTime.isAtSameMomentAs(now)) {
              _startDateTime = newStart;
              _endDateTime = newEnd;
            }
            break;

          case PeriodSelectorEnum.month:
            // Increment by 1 month
            DateTime newStart = DateTime(
              _startDateTime.year,
              _startDateTime.month + 1,
              1, // First day of the next month
            );
            DateTime newEnd = DateTime(
              _startDateTime.year,
              _startDateTime.month + 2,
              1, // First day of the month after the next
            ).subtract(const Duration(days: 1)); // Last day of the next month
            if (_endDateTime.isBefore(now) ||
                _endDateTime.isAtSameMomentAs(now)) {
              _startDateTime = newStart;
              _endDateTime = newEnd;
            }
            break;

          case PeriodSelectorEnum.year:
            // Increment by 1 year
            DateTime newStart = DateTime(_startDateTime.year + 1, 1, 1);
            DateTime newEnd = DateTime(_endDateTime.year + 1, 12, 31);
            if (_endDateTime.isBefore(now) ||
                _endDateTime.isAtSameMomentAs(now)) {
              _startDateTime = newStart;
              _endDateTime = newEnd;
            }
            break;
        }

        widget.onChangeDateTime(_startDateTime, _endDateTime);
      },
    );
  }

  void _onPressDecrementButton() {
    setState(
      () {
        switch (_selectedValue) {
          case PeriodSelectorEnum.day:
            // Decrement by 1 day
            _startDateTime = _startDateTime.subtract(const Duration(days: 1));
            _endDateTime = _endDateTime.subtract(const Duration(days: 1));
            break;

          case PeriodSelectorEnum.week:
            // Decrement by 1 week
            _startDateTime = _startDateTime.subtract(const Duration(days: 7));
            _endDateTime = _endDateTime.subtract(const Duration(days: 7));
            break;

          case PeriodSelectorEnum.month:
            // Decrement by 1 month
            _startDateTime = DateTime(
              _startDateTime.year,
              _startDateTime.month - 1,
              1, // First day of the previous month
            );

            _endDateTime = DateTime(
              _startDateTime.year,
              _startDateTime.month + 1,
              1, // First day of the current month
            ).subtract(
              const Duration(days: 1),
            ); // Last day of the previous month
            break;

          case PeriodSelectorEnum.year:
            // Decrement by 1 year
            _startDateTime = DateTime(_startDateTime.year - 1, 1, 1);
            _endDateTime = DateTime(_endDateTime.year - 1, 12, 31);
            break;
        }

        widget.onChangeDateTime(_startDateTime, _endDateTime);
      },
    );
  }

  void _onChangedPeriod() {
    DateTime now = DateTime.now();
    switch (_selectedValue) {
      case PeriodSelectorEnum.day:
        _startDateTime = now;
        _endDateTime = now;
        break;
      case PeriodSelectorEnum.week:
        _startDateTime =
            now.subtract(Duration(days: now.weekday - 1)); // Monday
        _endDateTime = _startDateTime.add(const Duration(days: 6)); // Sunday
        break;
      case PeriodSelectorEnum.month:
        _endDateTime = DateTime(now.year, now.month + 1, 0);
        _startDateTime = DateTime(_endDateTime.year, _endDateTime.month, 1);
        break;
      case PeriodSelectorEnum.year:
        _endDateTime = DateTime(now.year, 12, 31);
        _startDateTime = DateTime(_endDateTime.year, 1, 1);
        break;
    }
    widget.onChangeDateTime(_startDateTime, _endDateTime);
  }
}
