import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/routing/routes.dart';

class FlutterChartModel {
  final String title;
  final String route;
  final String? image;
  final String? description;
  final String? url;
  final List<String>? additionalUrls;

  const FlutterChartModel({
    required this.title,
    required this.route,
    this.image,
    this.description,
    this.url,
    this.additionalUrls,
  });

  static List<FlutterChartModel> getAllModels() => [
        const FlutterChartModel(
          title: StringConstants.flutterSleepChart,
          route: Routes.flutterSleepChartsPage,
        ),
      ];
}
