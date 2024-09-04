import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/core/routes/routes.dart';
import 'package:flutter_practice/src/features/badge_with_icon_button/badge_with_icon_button_page.dart';
import 'package:flutter_practice/src/features/carousel_view/carousel_view.dart';
import 'package:flutter_practice/src/features/stylish_text/stylish_text_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.stylishTextPage:
        return MaterialPageRoute(
          builder: (_) => const StylishTextPage(
            title: StringConstants.stylishText,
          ),
        );
      case Routes.badgeWithIconButtonPage:
        return MaterialPageRoute(
          builder: (_) => const BadgeWithIconButtonPage(
            title: StringConstants.badgeWithIconButton,
          ),
        );
      case Routes.carouselViewPage:
        return MaterialPageRoute(
          builder: (_) => const CarouselViewPage(
            title: StringConstants.carouselView,
          ),
        );
    }
    return null;
  }
}
