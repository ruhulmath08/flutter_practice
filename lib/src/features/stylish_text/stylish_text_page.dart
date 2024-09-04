import 'package:flutter/material.dart';

class StylishTextPage extends StatelessWidget {
  const StylishTextPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Flutter Stylish Text'),
      ),
    );
  }
}
