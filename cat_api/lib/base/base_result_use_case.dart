class BaseResultUseCase {
  BaseResultUseCase._();

  factory BaseResultUseCase.success(dynamic data) = SuccessResponse;
  factory BaseResultUseCase.nullOrEmptyData() = NullOrEmptyData;
  factory BaseResultUseCase.error(Exception exception)= ErrorResponse;
  factory BaseResultUseCase.noInternetConnection()= NoConnectionInternet;
}

class SuccessResponse<T> extends BaseResultUseCase {
  T data;
  SuccessResponse(this.data) : super._();
}

class NullOrEmptyData extends BaseResultUseCase {
  NullOrEmptyData() : super._();
}
class NoConnectionInternet extends BaseResultUseCase {
  NoConnectionInternet() : super._();
}

class ErrorResponse extends BaseResultUseCase {
  final Exception error;
  ErrorResponse(this.error) : super._();
}
