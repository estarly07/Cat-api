class BaseResultRepository{
  BaseResultRepository._();

  factory BaseResultRepository.success(dynamic data) = SuccessResponse;
  factory BaseResultRepository.nullOrEmptyData() = NullOrEmptyData;
  factory BaseResultRepository.errorApi(Exception exception)  = ErrorResponseApi;
}

class SuccessResponse<T> extends BaseResultRepository {
  final T data;
  SuccessResponse(this.data) : super._();
}
class NullOrEmptyData extends BaseResultRepository {
  NullOrEmptyData() : super._();
}

class ErrorResponseApi extends BaseResultRepository {
  final Exception exception;
  ErrorResponseApi(this.exception) : super._();
}
