import 'package:cat_api/base/base_result_repository.dart';
import 'package:cat_api/data/api/response/breed_response.dart';
import 'package:cat_api/data/api/services/breed_service.dart';
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedService _breedService;
  BreedRepositoryImpl(this._breedService);

  @override
  Future<BaseResultRepository> getBreeds(int page) async {
    try {
      final response = await _breedService.getBreeds(page);
      if(response==null || response.data ==null){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        List<BreedResponse> breedsResponse = [];
        (response.data as List).forEach((element) { 
          breedsResponse.add(BreedResponse.fromJson(element));
        });
        return BaseResultRepository.success
          (breedsResponse.map(
            (e) => e.parse()
          ).toList()
        );
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }

  @override
  Future<BaseResultRepository> getImageByReference(String referenceImageId) async{
    try {
      final response = await _breedService.getImageByReference(referenceImageId);
      if(response==null || response.data ==null){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        final data = (response.data as Map<String, dynamic>);
        return BaseResultRepository.success(data["url"]);
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }
  
}
extension BreedModelParse on BreedResponse{
  BreedModel parse(){
    return BreedModel(
      weight: weight.parse(), 
      id: id, 
      name: name, 
      temperament: temperament, 
      origin: origin,
       description: description, 
       lifeSpan: lifeSpan, 
       adaptability: adaptability, 
       affectionLevel: affectionLevel, 
       childFriendly: childFriendly, 
       dogFriendly: dogFriendly, 
       energyLevel: energyLevel, 
       grooming: grooming, 
       healthIssues: healthIssues, 
       intelligence: intelligence, 
       sheddingLevel: sheddingLevel, 
       socialNeeds: socialNeeds, 
       strangerFriendly: strangerFriendly, 
       vocalisation: vocalisation, 
       natural: natural, 
       rare: rare, 
       wikipediaUrl: wikipediaUrl, 
       hypoallergenic: hypoallergenic, 
       referenceImageId: referenceImageId);
  }
}
extension WeightResponsePase on Weight{
  WeightModel parse(){
    return WeightModel(imperial: imperial, metric: metric);
  }
}