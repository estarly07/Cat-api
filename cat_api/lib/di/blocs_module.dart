import 'package:cat_api/presentation/home/blocs/breed/breed_bloc.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => BreedBloc(getIt(),getIt()));
}