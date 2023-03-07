import 'dart:io';

import 'package:cat_api/base/base_result_use_case.dart';

class GetBreedsUseCase {

  Future<BaseResultUseCase> getBreedsUseCase() async {
    try {
      return BaseResultUseCase.nullOrEmptyData();
    } on Exception catch (e) {
      print(e);
      return BaseResultUseCase.error(e);
    }
  }
}