import 'package:aflami/core/networking/failures.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/models/trailer_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {


  Future<Either<Failure, List<MoviesModel>>> searchMovies({required String movieName});
  Future<Either<Failure, List<MoviesModel>>> getTopRated(int page);
Future<Either<Failure, List<MoviesModel>>> getNowPlaying(int page);
Future<Either<Failure, List<MoviesModel>>> getUpcoming(int page);
  Future<Either<Failure, List<MoviesModel>>> getPopular();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedTVShows();
  Future<Either<Failure, List<MoviesModel>>> getSimilarMovies({required int id});

  Future<Either<Failure,TrailerModel>>getMovieTrailer({required int id});
}
