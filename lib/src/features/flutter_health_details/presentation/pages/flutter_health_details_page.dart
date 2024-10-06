import 'package:flutter/material.dart';

class FlutterHealthDetailsPage extends StatelessWidget {
  const FlutterHealthDetailsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Flutter Health Details Page')),
    );
  }
}
