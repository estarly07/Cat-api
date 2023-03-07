import 'package:cat_api/base/base_result_use_case.dart';
import 'package:cat_api/base/base_result_repository.dart' as repository;
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/domain/breeds/get_image_breed_use_case.dart';
import 'package:cat_api/domain/validate_connection.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';

class GetBreedsUseCase {
  final BreedRepository _breedRepository;
  final GetImageBreedsUseCase _getImageBreedsUseCase;
  GetBreedsUseCase(this._breedRepository, this._getImageBreedsUseCase);

  Future<BaseResultUseCase> getBreedsUseCase(int page) async {
    try {
      if(!await isConnected()){
        return BaseResultUseCase.noInternetConnection();
      }
      final response = await _breedRepository.getBreeds(page);
    
      switch (response.runtimeType) {
        case repository.SuccessResponse:
        {
          List<BreedModel> list =  (response as repository.SuccessResponse).data;
          for (var item in list) {
            if(item.referenceImageId != null) {
              final response = await _getImageBreedsUseCase.getImageBreedsUseCase(item.referenceImageId!);
              if(response is SuccessResponse){
                item.referenceImageId = response.data;
                print(item.referenceImageId);
              }
            }
          }
          return BaseResultUseCase.success(list);
        }
        case repository.ErrorResponseApi:
          return BaseResultUseCase.error(
             (response as repository.ErrorResponseApi).exception
          );
        case repository.NullOrEmptyData:
        default :
          page -=1;
          return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.error(e);
    }
  }
}