import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/repositories/coach_repository.dart';
import 'package:pod1um_flutter_clone/repositories/listing_repository.dart';
import 'package:pod1um_flutter_clone/repositories/login_repository.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';

void main() {
  runApp(const Pod1umApp());
}

class Pod1umApp extends StatefulWidget {
  const Pod1umApp({super.key});

  @override
  State<Pod1umApp> createState() => _Pod1umAppState();
}

class _Pod1umAppState extends State<Pod1umApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
            create: (context) => ListingRepository(httpClient: http.Client())),
        RepositoryProvider<CoachRepository>(
            create: (context) => CoachRepository(httpClient: http.Client())),
        RepositoryProvider<LoginRepository>(
          create: (context) => LoginRepository(
            httpClient: http.Client(),
          ),
        )
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
                listingRepository: context.read<ListingRepository>(),
                coachRepository: context.read<CoachRepository>()),
          ),
          BlocProvider<SingleCoachCubit>(
            create: (context) => SingleCoachCubit(
                listingRepository: context.read<ListingRepository>(),
                coachRepository: context.read<CoachRepository>()),
          ),
          BlocProvider<LoginCubit>(
              create: (context) =>
                  LoginCubit(loginRepository: context.read<LoginRepository>()))
        ],
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff1F1F23),
          ),
          title: "POD1UM app",
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
