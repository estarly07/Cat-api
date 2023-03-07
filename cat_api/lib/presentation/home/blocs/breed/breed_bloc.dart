import 'package:bloc/bloc.dart';
import 'package:cat_api/base/base_result_use_case.dart';
import 'package:cat_api/domain/breeds/filter_by_breed_use_case.dart';
import 'package:cat_api/domain/breeds/get_breeds_use_case.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:meta/meta.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final  GetBreedsUseCase _getBreedsUseCase;
  final  FilterByBreedUseCase _filterByBreedUseCase;
  bool isGettingBreeds = false;
  int page = 1;
  List<BreedModel> saveList = [];
  BreedBloc(
    this._getBreedsUseCase,
    this._filterByBreedUseCase
  ) : super(BreedInitial())  {
    on<GetBreedsEvent>((event, emit) async {
      emit(LoadingBreedState());
      final responseBreeds = await _getBreedsUseCase.getBreedsUseCase(page);
      switch (responseBreeds.runtimeType) {
        case SuccessResponse:
            emit(LoadedBreedState((responseBreeds as SuccessResponse).data,false));
            saveList = (responseBreeds as SuccessResponse).data;
          break;
        case NullOrEmptyData:
            emit(const LoadedBreedState( <String>[],false));
          break;
        case NoConnectionInternet:
            emit(NoConnectionInternetState());
          break;
        case ErrorResponse:
            emit(ErrorBreedState());
          break;
      }

    });
    on<GetMoreBreedsEvent>((event, emit) async {
      page +=1;
      print(page);
      if(isGettingBreeds || page >= 6){
        print("object");
        page -=1;
        return;
      }
      emit(LoadedBreedState((state as LoadedBreedState).breeds,true));
      isGettingBreeds = true;
      final responseBreeds = await _getBreedsUseCase.getBreedsUseCase(page);
      isGettingBreeds = false;
      if(responseBreeds is SuccessResponse ){
        List list = saveList;
        list.addAll((responseBreeds).data);
        emit(LoadedBreedState(list,false));
        saveList = list as List<BreedModel>;
      }else{
        emit(LoadedBreedState(saveList,false));
        page -= 1;
      }
    });
    on<FilterBreedEvent>((event, emit) {
        emit(LoadedBreedState(_filterByBreedUseCase.filterByBreedUseCase(event.breed,saveList),false));
    });
  }
}
