/// Exception class representing a 401 Unauthorized HTTP response.
final class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 403 Forbidden HTTP response.
final class ForbiddenException implements Exception {
  final String message;

  ForbiddenException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 404 Not Found HTTP response.
final class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 500 Internal Server Error HTTP response.
final class InternalServerErrorException implements Exception {
  final String message;

  InternalServerErrorException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 502 Bad Gateway HTTP response.
final class BadGatewayException implements Exception {
  final String message;

  BadGatewayException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 503 Service Unavailable HTTP response.
final class ServiceUnavailableException implements Exception {
  final String message;

  ServiceUnavailableException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 400 Bad Request HTTP response.
final class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);

  @override
  String toString() => message;
}

/// Exception class representing a 409 Conflict HTTP response.
final class ConflictException implements Exception {
  final String message;

  ConflictException(this.message);

  @override
  String toString() => message;
}
