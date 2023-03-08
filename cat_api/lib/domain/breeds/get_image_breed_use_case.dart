import 'package:cat_api/base/base_result_use_case.dart';
import 'package:cat_api/base/base_result_repository.dart' as repository;
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/domain/validate_connection.dart';

class GetImageBreedsUseCase {
  final BreedRepository _breedRepository;
   final ConnectHelper _connectHelper;
  GetImageBreedsUseCase(this._breedRepository, this._connectHelper);

  Future<BaseResultUseCase> getImageBreedsUseCase(String referenceImageId) async {
    try {
      if(!await  _connectHelper.isConnected()){
        return BaseResultUseCase.noInternetConnection();
      }
      final response = await _breedRepository.getImageByReference(referenceImageId);
    
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