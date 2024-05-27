import 'dart:async' show TimeoutException;

import 'package:http/http.dart' show ClientException;

/// A utility class for handling and converting different types of errors into exceptions.
abstract final class ErrorHandler {
  /// Throws an exception based on the type of error provided.
  /// Returns an exception that corresponds to the specific error type.
  static Exception throwExceptionForError(dynamic error) {
    if (error is TimeoutException) {
      return TimeoutException('API not responded in time');
    } else if (error is FormatException) {
      return const FormatException('Something went wrong');
    } else if (error is ClientException) {
      return Exception('Can\'t connect to server');
    } else {
      return const FormatException('Something went wrong');
    }
  }
}
