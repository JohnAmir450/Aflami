import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo_implementation.dart';
import 'package:aflami/features/home/logic/home_cubit/home_cubit_cubit.dart';
import 'package:aflami/features/home/logic/now_playing_cubit/now_playing_cubit.dart';
import 'package:aflami/features/home/logic/popular_cubit/popular_cubit.dart';
import 'package:aflami/features/home/logic/search_cubit.dart/search_cubit.dart';
import 'package:aflami/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:aflami/features/home/logic/top_rated_cubit/top_rated_cubit.dart';
import 'package:aflami/features/home/logic/top_rated_tv_shows/top_rated_tv_shows_cubit.dart';
import 'package:aflami/features/home/logic/trailer_cubit/trailer_cubit.dart';
import 'package:aflami/features/home/logic/upcoming_cubit/upcoming_cubit.dart';
import 'package:aflami/features/home/ui/search_screen.dart';
import 'package:aflami/features/home/ui/show_more_top_rated_movies.dart';
import 'package:aflami/features/home/ui/movie_details.dart';
import 'package:aflami/features/home/ui/upcoming_movies_screen.dart';
import 'package:aflami/features/home/ui/show_more_now_playing-movies.dart';
import 'package:aflami/features/login/logic/login_cubit/login_cubit.dart';
import 'package:aflami/features/login/ui/login_screen.dart';
import 'package:aflami/features/onboarding/ui/onboarding_screen.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:aflami/features/register/ui/register_screen.dart';
import 'package:aflami/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aflami/core/di/di_setup.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return PageTransition(
          child: BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
          type: PageTransitionType.fade,
        );

      case Routes.registerScreen:
        return PageTransition(
            type: PageTransitionType.fade,
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterScreen(),
            ));

      case Routes.homeScreen:
        return PageTransition(
          child: MultiBlocProvider(providers: [
            BlocProvider(create: (context) => HomeCubit()..getUserData()),
            BlocProvider(
              create: ((context) =>
                  TopRatedCubit(gitIt.get<HomeRepoImpl>())..getTopRated(1)),
            ),
            BlocProvider(
              create: ((context) =>
                  PopularCubit(gitIt.get<HomeRepoImpl>())..getPopular()),
            ),
            BlocProvider(
                create: ((context) => NowPlayingCubit(gitIt.get<HomeRepoImpl>())
                  ..getNowPlaying(1))),
            BlocProvider(
                create: (context) => UpcomingCubit(gitIt.get<HomeRepoImpl>())
                  ..getUpcomingMovies(1)),
            BlocProvider(
                create: ((context) =>
                    TopRatedTvShowsCubit(gitIt.get<HomeRepoImpl>())
                      ..getTopRatedTVShows()))
          ], child: const HomeScreen()),
          type: PageTransitionType.fade,
        );
      case Routes.searchScreen:
        return PageTransition(
            child: BlocProvider(
              create: (context) =>
                  SearchCubit(gitIt.get<HomeRepoImpl>())..searchMovies(),
              child: const SearchScreen(),
            ),
            type: PageTransitionType.fade);
      case Routes.movieDetails:
        var moviesModel = settings.arguments as MoviesModel;
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      SimilarMoviesCubit(gitIt.get<HomeRepoImpl>())
                        ..getSimilarMovies(movieId: moviesModel.id!),
                ),
                BlocProvider(
                    create: (context) => TrailerCubit(gitIt.get<HomeRepoImpl>())
                      ..getMovieTrailers(moviesModel.id!))
              ],
              child: MovieDetails(
                moviesModel: moviesModel,
              ),
            ),
            type: PageTransitionType.fade);

      case Routes.showMoreTopRatedMovies:
        return PageTransition(
            child: BlocProvider(
              create: (context) =>
                  TopRatedCubit(gitIt.get<HomeRepoImpl>())..getTopRated(1),
              child: const ShowMoreTopRatedMoviesMovies(),
            ),
            type: PageTransitionType.fade);

      case Routes.showMoreNowPlayingMovies:
        return PageTransition(
            child: BlocProvider(
              create: (context) =>
                  NowPlayingCubit(gitIt.get<HomeRepoImpl>())..getNowPlaying(1),
              child: const ShowMoreNowPlayingMovies(),
            ),
            type: PageTransitionType.fade);

      case Routes.upcomingMoviesScreen:
        return PageTransition(
            child: BlocProvider(
              create: (context) => UpcomingCubit(gitIt.get<HomeRepoImpl>())
                ..getUpcomingMovies(1),
              child: const UpcomingMoviesScreen(),
            ),
            type: PageTransitionType.fade);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('no route defined for ${settings.name}')),
                ));
    }
  }
}
