import 'package:cat_api/base/base_result_repository.dart';

abstract class BreedRepository{
  Future<BaseResultRepository> getBreeds(int page);
   Future<BaseResultRepository> getImageByReference(String referenceImageId) ;
}