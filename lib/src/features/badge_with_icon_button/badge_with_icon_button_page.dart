import 'package:flutter/material.dart';

class BadgeWithIconButtonPage extends StatefulWidget {
  const BadgeWithIconButtonPage({super.key, required this.title});

  final String title;

  @override
  State<BadgeWithIconButtonPage> createState() =>
      _BadgeWithIconButtonPageState();
}

class _BadgeWithIconButtonPageState extends State<BadgeWithIconButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
