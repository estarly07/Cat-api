import 'package:mockito/annotations.dart';
import 'package:cat_api/domain/breeds/breed_repository.dart';
import 'package:cat_api/domain/breeds/get_image_breed_use_case.dart';
import 'package:cat_api/domain/validate_connection.dart';

@GenerateMocks([
  BreedRepository,
  GetImageBreedsUseCase,
  ConnectHelper
])

import 'mocks.mocks.dart';
export 'mocks.mocks.dart';