import 'package:aflami/core/networking/api_service.dart';
import 'package:aflami/core/networking/failures.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/models/trailer_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRated(int page) async {
    try {
      var data =
          await _apiService.get(endPoints: 'movie/top_rated', page: page);
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopular() async {
    try {
      var data = await _apiService.get(
        endPoints: 'movie/popular',
      );
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getSimilarMovies(
      {required int id}) async {
    try {
      var data = await _apiService.get(endPoints: 'movie/$id/similar');
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> searchMovies(
      {required String movieName}) async {
    try {
      var data = await _apiService.search(movieName: movieName);
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlaying(int page) async {
    try {
      var data =
          await _apiService.get(endPoints: 'movie/now_playing', page: page);
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getUpcoming(int page) async {
    try {
      var data = await _apiService.get(endPoints: 'movie/upcoming',page: page);

      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, TrailerModel>> getMovieTrailer({required int id})async {
    try {
      var data = await _apiService.get(endPoints: 'movie/$id/videos');
      TrailerModel trailerModel = TrailerModel.fromJson(data);

      return right(trailerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    
  }
  }
  
  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedTVShows()async {
       try {
      var data = await _apiService.get(
        endPoints: 'tv/top_rated',
      );
      List<MoviesModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
