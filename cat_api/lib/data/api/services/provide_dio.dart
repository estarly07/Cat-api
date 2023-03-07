import 'package:dio/dio.dart';

class ProvideDio {
    final dio = Dio(BaseOptions(
    baseUrl: "https://api.thecatapi.com/v1/",
    contentType: "application/json;charset=UTF-8",
    headers: {
      "x-api-key" :"bda53789-d59e-46cd-9bc4-2936630fde39"
    }
  ));

}