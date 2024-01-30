import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/user/user_cubit.dart';
import 'package:pod1um_flutter_clone/repositories/coach_repository.dart';
import 'package:pod1um_flutter_clone/repositories/listing_repository.dart';
import 'package:pod1um_flutter_clone/repositories/login_repository.dart';
import 'package:pod1um_flutter_clone/repositories/user_repository.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

void main() {
  runApp(const Pod1umApp());
}

class Pod1umApp extends StatefulWidget {
  const Pod1umApp({super.key});

  @override
  State<Pod1umApp> createState() => _Pod1umAppState();
}

class _Pod1umAppState extends State<Pod1umApp> {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    http.Client httpClient = http.Client();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
            create: (context) => ListingRepository(httpClient: httpClient)),
        RepositoryProvider<CoachRepository>(
            create: (context) => CoachRepository(httpClient: httpClient)),
        RepositoryProvider<LoginRepository>(
          create: (context) => LoginRepository(
            httpClient: httpClient,
          ),
        ),
        RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(httpClient: httpClient)),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<ListingsCubit>(
              create: (context) => ListingsCubit(
                  listingRepository: context.read<ListingRepository>()),
            ),
            BlocProvider<PagesCubit>(create: (context) => PagesCubit()),
            BlocProvider<SingleListingCubit>(
              create: (context) => SingleListingCubit(
                  userRepository: context.read<UserRepository>(),
                  listingRepository: context.read<ListingRepository>(),
                  coachRepository: context.read<CoachRepository>()),
            ),
            BlocProvider<SingleCoachCubit>(
              create: (context) => SingleCoachCubit(
                listingRepository: context.read<ListingRepository>(),
                coachRepository: context.read<CoachRepository>(),
                userRepository: context.read<UserRepository>(),
              ),
            ),
            BlocProvider<LoginCubit>(
                create: (context) => LoginCubit(
                    loginRepository: context.read<LoginRepository>())),
            BlocProvider<UserCubit>(
              create: (context) => UserCubit(
                userRepository: context.read<UserRepository>(),
              ),
            )
          ],
          child: ResponsiveBreakpoints(
            breakpoints: [
              const Breakpoint(start: 0, end: 299, name: EXTRA_SMALL),
              const Breakpoint(start: 300, end: 599, name: MID_SMALL),
              const Breakpoint(start: 600, end: 904, name: SMALL),
              const Breakpoint(start: 905, end: 1239, name: MEDIUM),
              const Breakpoint(start: 1240, end: 1439, name: LARGE),
              const Breakpoint(start: 1440, end: 2499, name: EXTRA_LARGE),
              const Breakpoint(
                  start: 2500, end: double.infinity, name: EXTRA_LARGE_2),
            ],
            child: MaterialApp.router(
              routerConfig: _appRouter.config(
                navigatorObservers: () => [AutoRouteObserver()],
              ),
              theme: ThemeData(
                scaffoldBackgroundColor: Color(0xff1F1F23),
              ),
              title: "POD1UM app",
              debugShowCheckedModeBanner: false,
            ),
          )),
    );
  }
}
