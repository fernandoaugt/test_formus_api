import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_formus_api/view/home/home.dart';
import 'package:test_formus_api/view/movie_view/movie_view.dart';

abstract class Pages {
  static final routes = <GetPage>[
    GetPage(name: PagesRoutes.home, page: () => Home()),
    GetPage(name: PagesRoutes.movieView, page: () => Movieview()),
  ];
}

abstract class PagesRoutes {
  static const String movieView = '/movie_view';
  static const String home = '/home';
}
