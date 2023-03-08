import 'package:cat_api/flavors.dart';
import 'package:dio/dio.dart';

class ProvideDio {
  final dio = Dio(BaseOptions(
    baseUrl: Flavor.flavor!.baseUrlApi,
    contentType: "application/json;charset=UTF-8",
    headers: {
      "x-api-key" :Flavor.flavor!.xApiKey
    }
  ));
}