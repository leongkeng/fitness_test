class NetworkErrorException implements Exception {
  final String message;

  NetworkErrorException(this.message);

  @override
  String toString() {
    return "NetworkErrorException: $message";
  }
}
