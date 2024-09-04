import 'package:flutter/material.dart';

class PhotoHeroWidget extends StatelessWidget {
  const PhotoHeroWidget({
    super.key,
    required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flippers Page'),
      ),
      body: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: Image.network(
            photo,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
