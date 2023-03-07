import 'package:cat_api/data/api/services/provide_dio.dart';
import 'package:dio/dio.dart';

class BreedService  {
  BreedService(this._dio);
  final ProvideDio _dio;
  Future<Response?> getBreeds() async => await _dio.dio.get("breeds");
}