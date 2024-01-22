import 'package:auto_route/auto_route.dart';
import 'package:pod1um_flutter_clone/pages/dashboard/dashboard.dart';
import 'package:pod1um_flutter_clone/pages/explore_page.dart';
import 'package:pod1um_flutter_clone/pages/feed_page.dart';
import 'package:pod1um_flutter_clone/pages/home_page.dart';
import 'package:pod1um_flutter_clone/pages/initial_page.dart';
import 'package:pod1um_flutter_clone/pages/library_page.dart';
import 'package:pod1um_flutter_clone/pages/login_page.dart';
import 'package:pod1um_flutter_clone/pages/single_coach_page.dart';

import '../pages/single_listing_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Initial.page, initial: true),
        AutoRoute(page: Login.page),
        AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
          CustomRoute(
              path: "",
              page: Home.page,
              durationInMilliseconds: 0,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
              path: "explore",
              page: Explore.page,
              durationInMilliseconds: 0,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
              path: "feed",
              page: Feed.page,
              durationInMilliseconds: 0,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
              path: "library",
              page: Library.page,
              durationInMilliseconds: 0,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
              path: "listing/:id",
              page: SingleListing.page,
              durationInMilliseconds: 0,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
            path: "coach/:id",
            page: Coach.page,
            durationInMilliseconds: 0,
            transitionsBuilder: TransitionsBuilders.noTransition,
          )
        ]),
        // AutoRoute(page: SingleListing.page),
      ];
}
