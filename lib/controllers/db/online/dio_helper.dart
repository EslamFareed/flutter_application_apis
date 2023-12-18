import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        // connectTimeout: Duration(),
        // receiveDataWhenStatusError: true,
        // followRedirects: true,
      ),
    );
  }
}
