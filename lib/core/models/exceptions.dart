class AppException implements Exception {
  final String message;
  AppException({this.message = "An unexpected error occurred"});
}
