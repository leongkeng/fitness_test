class ClientErrorException implements Exception {
  final String message;

  ClientErrorException(this.message);

  @override
  String toString() {
    return "ClientErrorException: $message";
  }
}

