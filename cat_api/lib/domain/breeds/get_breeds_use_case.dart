import 'package:cat_api/base/base_result_use_case.dart';
import 'package:cat_api/base/base_result_repository.dart' as repository;
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/domain/validate_connection.dart';

class GetBreedsUseCase {
  final BreedRepository _breedRepository;
  GetBreedsUseCase(this._breedRepository);

  Future<BaseResultUseCase> getBreedsUseCase() async {
    try {
      if(!await isConnected()){
        return BaseResultUseCase.noInternetConnection();
      }
      final response = await _breedRepository.getBreeds();
    
      switch (response.runtimeType) {
        case repository.SuccessResponse:
          return BaseResultUseCase.success(
            (response as repository.SuccessResponse).data
          );
        case repository.ErrorResponseApi:
          return BaseResultUseCase.error(
             (response as repository.ErrorResponseApi).exception
          );
        case repository.NullOrEmptyData:
        default :
           return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.error(e);
    }
  }
}