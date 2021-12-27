class ApiException {
  const ApiException(this.uri, this.message, this.statusCode);

  const ApiException.unknown(this.uri, this.message) : statusCode = 0;

  final Uri uri;
  final int statusCode;
  final String message;

  @override
  String toString() =>
      'ApiException{uri=$uri, statusCode=$statusCode, message=$message}';
}
