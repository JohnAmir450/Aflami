import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _baseUrl = 'https://api.spacexdata.com/v4/';
  static Dio _dio = Dio();

  static Future<void> init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://api.spacexdata.com/v4/',
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    );

    _dio = Dio(baseOptions);
    addDioInterceptor();
    return Future.value();
  }

  Future<List<dynamic>> get({required String endPoints}) async {
    var response = await _dio.get('$_baseUrl$endPoints');
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