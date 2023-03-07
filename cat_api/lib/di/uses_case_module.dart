import 'package:cat_api/domain/breeds/filter_by_breed_use_case.dart';
import 'package:cat_api/domain/breeds/get_breeds_use_case.dart';
import 'package:cat_api/domain/breeds/get_image_breed_use_case.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => GetBreedsUseCase(getIt(),getIt()));
  getIt.registerFactory(() => FilterByBreedUseCase());
  getIt.registerFactory(() => GetImageBreedsUseCase(getIt()));
}