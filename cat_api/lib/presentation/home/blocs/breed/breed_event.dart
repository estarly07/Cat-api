part of 'breed_bloc.dart';

@immutable
abstract class BreedEvent {}

class GetBreedsEvent extends BreedEvent{}
class GetMoreBreedsEvent extends BreedEvent{}
class FilterBreedEvent extends BreedEvent{
  final String breed;
  FilterBreedEvent(this.breed);
}