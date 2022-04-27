class ServerException implements Exception {
  ServerException({
    required this.statusCode,
    this.message,
  });

  final int statusCode;
  final String? message;

  // @override
  // String toString() {
  //   // ignore: lines_longer_than_80_chars
  //   return 'ServerException: [status: $statusCode url: $url message: $message] : $stackTrace';
  // }
}
