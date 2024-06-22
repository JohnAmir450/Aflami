import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static const String  _apiKey='c55d03236ef2a2f10ec819811bab5461';
  final _baseUrl = 'https://api.themoviedb.org/3/';
  static Dio _dio = Dio();

  static Future<void> init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    );

    _dio = Dio(baseOptions);
    addDioInterceptor();
    return Future.value();
  }

  Future<Map<String,dynamic>> get({required String endPoints, int page =1}) async {
    var response = await _dio.get('$_baseUrl$endPoints?api_key=$_apiKey&page=$page&language=en-US');
    return response.data;
  }
   Future<Map<String,dynamic>> search({required String movieName}) async {
    var response = await _dio.get('${_baseUrl}search/movie?query=$movieName&api_key=$_apiKey');
    return response.data;
  }

  static void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}