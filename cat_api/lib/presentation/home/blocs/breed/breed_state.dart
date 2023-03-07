part of 'breed_bloc.dart';

@immutable
abstract class BreedState {
  const BreedState();

  factory BreedState.initial() => BreedInitial();
  factory BreedState.loadingBreedState() => LoadingBreedState();
  factory BreedState.errorBreedState()   => ErrorBreedState();
  factory BreedState.noConnectionInternet()   => NoConnectionInternetState();
  factory BreedState.loadedBreedState(List breeds,bool loadingMoreBreads)  => LoadedBreedState(breeds,loadingMoreBreads);
}

class BreedInitial      extends BreedState {}
class LoadingBreedState extends BreedState {}
class LoadedBreedState  extends BreedState {
  final List breeds;
  final bool loadingMoreBreads;//to show a loading progress of getting more items
  const LoadedBreedState(this.breeds, this.loadingMoreBreads);
}
class ErrorBreedState   extends BreedState {}
class NoConnectionInternetState   extends BreedState {}
