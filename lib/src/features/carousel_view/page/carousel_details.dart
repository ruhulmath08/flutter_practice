import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarouselDetailsPage extends StatefulWidget {
  const CarouselDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<CarouselDetailsPage> createState() => _CarouselDetailsPageState();
}

class _CarouselDetailsPageState extends State<CarouselDetailsPage> {
  final images = List.generate(
    10,
    (index) => Hero(
      tag: 'image-$index',
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/seed/${index * 7}/350/250',
        fit: BoxFit.cover,
        fadeInDuration: Duration.zero,
      ),
    ),
  );

  final imagesFull = List.generate(
    10,
    (index) => Hero(
      tag: 'image-$index',
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/seed/${index * 7}/720/1280',
        fit: BoxFit.cover,
        fadeInDuration: Duration.zero,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 20,
              maxHeight: 250,
            ),
            child: CarouselView(
              itemExtent: 350,
              itemSnapping: true,
              children: images,
            ),
          ),
        ),
      ),
    );
  }
}

//ToDo: please follow this -> https://www.youtube.com/watch?v=90S2dktY4Ck
// Note: CarouselView.weighted() is available only master channel date: 06-09-2024