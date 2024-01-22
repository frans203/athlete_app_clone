// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Dashboard(),
      );
    },
    Explore.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExplorePage(),
      );
    },
    Feed.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedPage(),
      );
    },
    Home.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    Initial.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialPage(),
      );
    },
    Library.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LibraryPage(),
      );
    },
    Login.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    Coach.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CoachArgs>(
          orElse: () => CoachArgs(coachId: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleCoachPage(coachId: args.coachId),
      );
    },
    SingleListing.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleListingArgs>(
          orElse: () => SingleListingArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SingleListingPage(id: args.id),
      );
    },
  };
}

/// generated route for
/// [Dashboard]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExplorePage]
class Explore extends PageRouteInfo<void> {
  const Explore({List<PageRouteInfo>? children})
      : super(
          Explore.name,
          initialChildren: children,
        );

  static const String name = 'Explore';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedPage]
class Feed extends PageRouteInfo<void> {
  const Feed({List<PageRouteInfo>? children})
      : super(
          Feed.name,
          initialChildren: children,
        );

  static const String name = 'Feed';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialPage]
class Initial extends PageRouteInfo<void> {
  const Initial({List<PageRouteInfo>? children})
      : super(
          Initial.name,
          initialChildren: children,
        );

  static const String name = 'Initial';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryPage]
class Library extends PageRouteInfo<void> {
  const Library({List<PageRouteInfo>? children})
      : super(
          Library.name,
          initialChildren: children,
        );

  static const String name = 'Library';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class Login extends PageRouteInfo<void> {
  const Login({List<PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingleCoachPage]
class Coach extends PageRouteInfo<CoachArgs> {
  Coach({
    required int coachId,
    List<PageRouteInfo>? children,
  }) : super(
          Coach.name,
          args: CoachArgs(coachId: coachId),
          rawPathParams: {'id': coachId},
          initialChildren: children,
        );

  static const String name = 'Coach';

  static const PageInfo<CoachArgs> page = PageInfo<CoachArgs>(name);
}

class CoachArgs {
  const CoachArgs({required this.coachId});

  final int coachId;

  @override
  String toString() {
    return 'CoachArgs{coachId: $coachId}';
  }
}

/// generated route for
/// [SingleListingPage]
class SingleListing extends PageRouteInfo<SingleListingArgs> {
  SingleListing({
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          SingleListing.name,
          args: SingleListingArgs(id: id),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SingleListing';

  static const PageInfo<SingleListingArgs> page =
      PageInfo<SingleListingArgs>(name);
}

class SingleListingArgs {
  const SingleListingArgs({required this.id});

  final int id;

  @override
  String toString() {
    return 'SingleListingArgs{id: $id}';
  }
}
