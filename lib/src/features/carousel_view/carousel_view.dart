import 'package:flutter/material.dart';

class CarouselViewPage extends StatefulWidget {
  const CarouselViewPage({super.key, required this.title});

  final String title;

  @override
  State<CarouselViewPage> createState() =>
      _CarouselViewPageState();
}

class _CarouselViewPageState extends State<CarouselViewPage> {
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