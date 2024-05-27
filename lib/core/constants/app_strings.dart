/// The class [AppStrings] provides a convenient way to access string constants within the app.
///
/// To use this class, import 'package:flutter/material.dart' and 'package:your_app_name/app_strings.dart'.
/// Once imported, you can access the static constant 'login' to display a login text in your Flutter app.
///
/// Example usage:
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:your_app_name/app_strings.dart';
///
/// // ...
///
/// Text(
///   AppStrings.login,
///   style: TextStyle(
///     fontSize: 16,
///     fontWeight: FontWeight.bold,
///   ),
/// )
/// ```
///
/// In this example, the static constant 'login' is set to the string "login". You can use it to display the login text
/// with the specified style in your Flutter app.
///
/// Please ensure that you have the necessary imports and that the app_strings.dart file is located correctly within your project.
abstract final class AppStrings {
  AppStrings._();

  static const String login = 'login';
}
