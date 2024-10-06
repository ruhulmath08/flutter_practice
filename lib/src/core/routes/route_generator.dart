import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/constants/string_constants.dart';
import 'package:flutter_practice/src/core/routes/routes.dart';
import 'package:flutter_practice/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_practice/src/features/badge_with_icon_button/badge_with_icon_button_page.dart';
import 'package:flutter_practice/src/features/carousel_view/page/carousel_details.dart';
import 'package:flutter_practice/src/features/carousel_view/page/carousel_view_page.dart';
import 'package:flutter_practice/src/features/carousel_view/page/flutter_carousel.dart';
import 'package:flutter_practice/src/features/flutter_health_details/presentation/pages/flutter_health_details_page.dart';
import 'package:flutter_practice/src/features/flutter_show_case_view/flutter_show_case_view.dart';
import 'package:flutter_practice/src/features/flutter_widgets/flutter_range_slider_page.dart';
import 'package:flutter_practice/src/features/home/page/home_page.dart';
import 'package:flutter_practice/src/features/multi_tap_detector/pages/multi_tap_detector_page.dart';
import 'package:flutter_practice/src/features/stylish_text/stylish_text_page.dart';
import 'package:showcaseview/showcaseview.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: StringConstants.home,
          ),
        );
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
      case Routes.multiTapDetectorPage:
        return MaterialPageRoute(
          builder: (_) => const MultiTapDetectorPage(
            title: StringConstants.multiTapDetector,
          ),
        );
      case Routes.flutterRangeSliderPage:
        return MaterialPageRoute(
          builder: (_) => const FlutterRangeSliderPage(
            title: StringConstants.flutterRangeSlider,
          ),
        );

      ///Flutter carousel
      case Routes.carouselViewPage:
        return MaterialPageRoute(
          builder: (_) => const CarouselViewPage(
            title: StringConstants.carouselView,
          ),
        );
      case Routes.flutterCarouselPage:
        return MaterialPageRoute(
          builder: (_) => const FlutterCarousel(
            title: StringConstants.flutterCarousel,
          ),
        );
      case Routes.carouselDetailsPage:
        return MaterialPageRoute(
          builder: (_) => const CarouselDetailsPage(
            title: StringConstants.carouselDetails,
          ),
        );
      case Routes.flutterHealthDetailsPage:
        return MaterialPageRoute(
          builder: (_) => const FlutterHealthDetailsPage(
            title: StringConstants.flutterHealthDetails,
          ),
        );

      case Routes.flutterShowcaseViewPage:
        return MaterialPageRoute(
          builder: (_) => ShowCaseWidget(
            builder: (_) =>const FlutterShowCaseView(
              title: StringConstants.flutterShowCaseView,
            ),
          ),
        );
    }
    return null;
  }
}
