import 'package:flutter/material.dart';
import 'package:product_hunt_app/models/post.dart';
import 'package:product_hunt_app/presentation/pages/home/home_page.dart';
import 'package:product_hunt_app/presentation/pages/comments/comments_page.dart';
import 'package:product_hunt_app/presentation/pages/specific_day/specific_day_page.dart';

/// Routes for Product Hunt App
abstract class Routes {
  /// Home (initial) Page
  static const String homePage = '/';

  /// Comments (of a post) Page
  static const String commentsPage = '/comments';

  /// Specific Day Posts Page
  static const String specificDayPage = '/specific_day';

  /// Route Generation
  static PageRoute onGenerateRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.homePage:
        return MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        );

      case Routes.commentsPage:
        return MaterialPageRoute<void>(
          builder: (context) => CommentsPage(
            post: routeSettings.arguments! as Post,
          ),
        );

      case Routes.specificDayPage:
        return MaterialPageRoute<void>(
          builder: (context) => const SpecificDayPage(),
        );
    }

    return MaterialPageRoute<void>(
      builder: (context) => const Text('404 - Unknown Route'),
    );
  }
}
