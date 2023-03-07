import 'package:cat_api/data/api/services/provide_dio.dart';
import 'package:dio/dio.dart';

class BreedService  {
  BreedService(this._dio);
  final ProvideDio _dio;
  Future<Response?> getBreeds(int pag) async => await _dio.dio.get("breeds?limit=10&&page=$pag");

  Future<Response?> getImageByReference(String referenceImageId) async => await _dio.dio.get("/images/$referenceImageId");
}