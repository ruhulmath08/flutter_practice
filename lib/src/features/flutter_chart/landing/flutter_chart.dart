import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/flutter_chart/landing/flutter_chart_model.dart';

class FlutterChart extends StatefulWidget {
  const FlutterChart({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FlutterChart> createState() => _FlutterChartState();
}

class _FlutterChartState extends State<FlutterChart> {
  late final List<FlutterChartModel> models;

  @override
  void initState() {
    models = FlutterChartModel.getAllModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            final FlutterChartModel model = models[index];
            return ElevatedButton(
              child: Text(model.title),
              onPressed: () => Navigator.pushNamed(context, model.route),
            );
          },
        ),
      ),
    );
  }
}

/*
* https://dchart.pages.dev/
* https://pub.dev/packages/flutter_charts
* https://pub.dev/packages/syncfusion_flutter_charts
*
* */
