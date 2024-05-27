import 'dart:io' show InternetAddress, SocketException;

/// A utility class for checking the internet connection status.
abstract final class CheckConnection {
  /// Checks the internet connection status by attempting to lookup the address of 'google.com'.
  /// Returns `true` if the device is connected to the internet, and `false` otherwise.
  static Future<bool> connectionStatus() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
