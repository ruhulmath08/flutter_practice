import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/core/routes/routes.dart';

class HomeModel {
  const HomeModel({
    required this.title,
    required this.route,
    required this.image,
  });

  final String title;
  final String route;
  final String image;

  static List<HomeModel> fetchAll() => [
        const HomeModel(
          title: StringConstants.stylishText,
          route: Routes.stylishTextPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.badgeWithIconButton,
          route: Routes.badgeWithIconButtonPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.flutterCarousel,
          route: Routes.flutterCarouselPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.multiTapDetector,
          route: Routes.multiTapDetectorPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.flutterRangeSlider,
          route: Routes.flutterRangeSliderPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.flutterHealthDetails,
          route: Routes.flutterHealthDetailsPage,
          image: 'image',
        ),
        const HomeModel(
          title: StringConstants.flutterShowCaseView,
          route: Routes.flutterShowcaseViewPage,
          image: 'image',
        ),
      ];
}
