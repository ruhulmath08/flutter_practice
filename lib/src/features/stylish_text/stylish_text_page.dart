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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ShaderMask(
            shaderCallback: (bound) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff87016e),
                Color(0xffac255e),
                Color(0xffcad85c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ],
            ).createShader(bound),
            child: const Text(
              'Flutter Stylish Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 96,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
