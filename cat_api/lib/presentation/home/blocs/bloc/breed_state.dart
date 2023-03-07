part of 'breed_bloc.dart';

@immutable
abstract class BreedState {
  const BreedState();

  factory BreedState.initial() => BreedInitial();
  factory BreedState.loadingBreedState() => LoadingBreedState();
  factory BreedState.errorBreedState()   => ErrorBreedState();
  factory BreedState.loadedBreedState(List breeds)  => LoadedBreedState(breeds);
}

class BreedInitial      extends BreedState {}
class LoadingBreedState extends BreedState {}
class LoadedBreedState  extends BreedState {
  final List breeds;
  const LoadedBreedState(this.breeds);
}
class ErrorBreedState   extends BreedState {}
