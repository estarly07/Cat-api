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
  List<BreedModel> saveList = [];
  BreedBloc(
    this._getBreedsUseCase,
    this._filterByBreedUseCase
  ) : super(BreedInitial())  {
    on<GetBreedsEvent>((event, emit) async {
      emit(LoadingBreedState());

      final responseBreeds = await _getBreedsUseCase.getBreedsUseCase();
      print("USECASE => ${responseBreeds.runtimeType}");
      switch (responseBreeds.runtimeType) {
        case SuccessResponse:
            emit(LoadedBreedState((responseBreeds as SuccessResponse).data));
            saveList = (responseBreeds).data;
          break;
        case NullOrEmptyData:
            emit(const LoadedBreedState( <String>[]));
          break;
        case NoConnectionInternet:
            emit(NoConnectionInternetState());
          break;
        case ErrorResponse:
          emit(ErrorBreedState());
          break;
      }

    });
    on<FilterBreedEvent>((event, emit) {
        emit(LoadedBreedState(_filterByBreedUseCase.filterByBreedUseCase(event.breed,saveList)));
    });
  }
}
