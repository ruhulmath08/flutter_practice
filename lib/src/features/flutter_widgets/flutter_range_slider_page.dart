import 'package:flutter/material.dart';

class FlutterRangeSliderPage extends StatefulWidget {
  const FlutterRangeSliderPage({super.key, required this.title});

  final String title;

  @override
  State<FlutterRangeSliderPage> createState() => _FlutterRangeSliderPageState();
}

class _FlutterRangeSliderPageState extends State<FlutterRangeSliderPage> {
  RangeValues _currentRangeValues = const RangeValues(0, 23);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              RangeSlider(
                values: _currentRangeValues,
                max: 23,
                divisions: 23,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildText('Start value: ${_currentRangeValues.start.round()}'),
              _buildText('End value: ${_currentRangeValues.end.round()}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
