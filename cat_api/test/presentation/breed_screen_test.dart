import 'package:cat_api/domain/breeds/filter_by_breed_use_case.dart';
import 'package:cat_api/domain/breeds/get_breeds_use_case.dart';
import 'package:cat_api/presentation/breed/ui/screen/breed_screen.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GetBreedsUseCase,
  FilterByBreedUseCase
])
void main(){
  final mockData = BreedModel(
        weight: WeightModel(imperial: "",metric: ""),
        id: "",
        name: "",
        temperament: "temperament",
        origin: "origin",
        description: "description",
        lifeSpan: "lifeSpan",
        adaptability: 1,
        affectionLevel: 1,
        childFriendly: 1,
        dogFriendly: 1,
        energyLevel: 1,
        grooming: 1,
        healthIssues: 1,
        intelligence: 1,
        sheddingLevel: 1,
        socialNeeds: 1,
        strangerFriendly: 1,
        vocalisation: 1,
        natural: 1,
        rare: 1,
        wikipediaUrl: null,
        hypoallergenic: 1,
        referenceImageId: "referenceImageId");
  testWidgets("validate that the customtext is not displayed if the wikepediaurl comes null", (tester)async{
    await tester.pumpWidget( MaterialApp(
      onGenerateInitialRoutes: (settings){
        return [MaterialPageRoute(
          settings: RouteSettings(arguments: mockData),
          builder: (_)=> BreedScreen()
        )];
    },));
    await tester.pump();
    expect(
      find.text("mockData.wikipediaUrl!"), findsNothing, reason: "La wikipediaUrl es nula entonces no deberia mostrarse");
  });
}