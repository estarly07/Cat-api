import 'package:cat_api/base/base_result_repository.dart';
import 'package:cat_api/base/base_result_use_case.dart' as usecase;
import 'package:cat_api/domain/breeds/get_breeds_use_case.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../domain/mocks.dart';

void main() {
  late GetBreedsUseCase _breedsUseCase;
  late MockBreedRepository _breedRepository;
  late MockGetImageBreedsUseCase _getImageBreedsUseCase;
  late MockConnectHelper _connetHelper;
  final dataMock = [
    BreedModel(
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
        wikipediaUrl: "wikipediaUrl",
        hypoallergenic: 1,
        referenceImageId: "referenceImageId")
  ];

  setUpAll(() {
    _breedRepository = MockBreedRepository();
    _getImageBreedsUseCase = MockGetImageBreedsUseCase();
    _connetHelper = MockConnectHelper();
    _breedsUseCase = GetBreedsUseCase(
        _breedRepository, _getImageBreedsUseCase, _connetHelper);
  });
  group("Test GetBreedsUseCase >", (){
    test('When the isConnected function returns false the use case must return NoConnection',() async {
      when(_connetHelper.isConnected()).thenAnswer((_) async => false);
      final response = await _breedsUseCase.getBreedsUseCase(1);
      expect(response.runtimeType, usecase.NoConnectionInternet, reason:"Se esparaba que el caso de uso devolviera noInternetConnection y de volvio = ${response.runtimeType}");
    });
    test('When the repository returns success but getImageBreedsUseCase returns nullOrEmptyData, you should keep the image references',() async {
      when(_breedRepository.getBreeds(1)).thenAnswer((_) async => BaseResultRepository.success(dataMock));
      when(_getImageBreedsUseCase.getImageBreedsUseCase(dataMock[0].referenceImageId)).thenAnswer((_) async => usecase.BaseResultUseCase.nullOrEmptyData(),);
      when(_connetHelper.isConnected()).thenAnswer((_) async => true);
      final response = await _breedsUseCase.getBreedsUseCase(1);
      expect(response.runtimeType, usecase.SuccessResponse,reason:"Se esparaba que el caso de uso devolviera SuccessResponse y de volvio = ${response.runtimeType}");
      expect(
        (response as usecase.SuccessResponse).data[0].referenceImageId, 
        dataMock[0].referenceImageId,
        reason:"Se esparaba que no cambiara el referenceImageId  ${dataMock[0].referenceImageId} y lo cambio ${response.data[0].referenceImageId}");
    });
  });
}
