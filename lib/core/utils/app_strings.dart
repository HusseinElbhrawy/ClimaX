class AppStrings {
  const AppStrings._();
  static const AppStrings _instance = AppStrings._();
  factory AppStrings() => _instance;

  static const String appName = 'ClimaX';

  static const String noRouteFound = 'No Route Found';

  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String serverError = 'Server Error';
  static const String cachedError = 'Cached Error';
  static const String fetchDataError = 'Fetch Data Error';
  static const String unExpectedError = 'UnExpected Error';
  static const String badRequestError = 'Bad Request Error';
  static const String unauthorizedError = 'Un Authorized Error';
  static const String notFoundError = 'Not Found Error';
  static const String conflictError = 'Conflict Error';
  static const String internalServerError = 'Internal Server Error';
  static const String noInternetConnectionError = 'No Internet Connection';
}
