import 'package:cat_api/data/repositories/breed_repository_impl.dart';
import 'package:cat_api/data/repositories/methods_native_repository_impl.dart';
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/domain/methods_native_repository.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerLazySingleton<BreedRepository>(()=> BreedRepositoryImpl(getIt()));
  getIt.registerLazySingleton<MethodsNativeRepository>(()=> MethodsNativeRepositoryImpl(getIt()));
}