class CsrfInvalidException implements Exception {
  String cause;
  CsrfInvalidException(this.cause);
}
