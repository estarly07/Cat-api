import 'package:cat_api/presentation/global/models/breed_model.dart';

class FilterByBreedUseCase {
  List<BreedModel> filterByBreedUseCase(String breed, List<BreedModel> breeds){
    List<BreedModel> breedsFilter = [];
    for (var item in breeds) {
      if(item.name.toUpperCase().contains(breed.toUpperCase())){
        breedsFilter.add(item);
      }
    }
    return breed.isEmpty? breeds : breedsFilter;
  }
  
}