import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/core/routes/routes.dart';

class FlutterCarousel extends StatelessWidget {
  const FlutterCarousel({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              Routes.carouselViewPage,
            ),
            child: const Text(StringConstants.carouselView),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              Routes.carouselDetailsPage,
            ),
            child: const Text(StringConstants.carouselDetails),
          ),
        ],
      ),
    );
  }
}
