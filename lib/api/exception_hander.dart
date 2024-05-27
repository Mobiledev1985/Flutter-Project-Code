import 'api_exceptions.dart';

/// A utility class for handling and converting HTTP status codes into corresponding exceptions.
abstract final class ExceptionHandler {
  /// Throws an exception based on the given HTTP status code.
  /// Returns an exception that corresponds to the specific status code.
  static Exception throwExceptionForStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return BadRequestException('Bad Request');
      case 401:
        return UnauthorizedException('Unauthorized');
      case 403:
        return ForbiddenException('Forbidden');
      case 404:
        return NotFoundException('Not Found');
      case 500:
        return InternalServerErrorException('Internal Server Error');
      case 502:
        return BadGatewayException('Bad Gateway');
      case 503:
        return ServiceUnavailableException('Service Unavailable');
      case 409:
        return ConflictException('Conflict');
      default:
        return Exception('An unexpected error occurred');
    }
  }
}
