import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/carousel_view/widgets/photo_hero.dart';

class CarouselViewPage extends StatefulWidget {
  const CarouselViewPage({super.key, required this.title});

  final String title;

  @override
  State<CarouselViewPage> createState() => _CarouselViewPageState();
}

class _CarouselViewPageState extends State<CarouselViewPage> {
  late CarouselController _carouselController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    _carouselController.addListener(_scrollListener);
  }

  _scrollListener() {
    setState(() {
      _selectedIndex = (_carouselController.offset / 343).ceil();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: CarouselView(
                controller: _carouselController,
                onTap: (int index) {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) {
                        return PhotoHeroWidget(
                          photo: 'https://picsum.photos/400?randon=$index',
                        );
                      },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                itemExtent: 343,
                itemSnapping: true,
                elevation: 4,
                padding: const EdgeInsets.all(8),
                children: List.generate(10, (int index) {
                  return Image.network(
                    'https://picsum.photos/400?randon=$index',
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNextButton(
                  onTap: () {
                    _carouselController.animateTo(
                      (_selectedIndex - 1) * 343,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  },
                  icons: Icons.arrow_back_ios_outlined,
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _carouselController.animateTo(
                              index * 343,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        child: AnimatedContainer(
                          width: 10,
                          height: 10,
                          duration: const Duration(milliseconds: 600),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == index
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 10),
                _buildNextButton(
                  onTap: () {
                    _carouselController.animateTo(
                      (_selectedIndex + 1) * 343,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  },
                  icons: Icons.arrow_forward_ios_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton({
    required Function() onTap,
    required IconData icons,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icons,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photo,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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
