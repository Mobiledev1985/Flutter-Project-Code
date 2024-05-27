import 'validation_error_strings.dart';

abstract final class CardValidators {
  /// Card Number Validation
  static String? isValidCardNumber(final String? cardNumber) {
    if (cardNumber == null) return null;
    if (cardNumber.isEmpty) {
      return ValidatorsErrorStrings.emptyError;
    }
    // Regular expression to match a 16-digit card number
    final RegExp cardNumberRegex = RegExp(r'^\d{16}$');
    if (!cardNumberRegex.hasMatch(cardNumber)) {
      return ValidatorsErrorStrings.invalidCardNumber;
    }
    return null;
  }

  /// CVV Validation
  static String? isValidCVV(final String? cvv) {
    if (cvv == null) return null;
    if (cvv.isEmpty) {
      return ValidatorsErrorStrings.emptyError;
    }
    // Regular expression to match a 3-digit CVV
    final RegExp cvvRegex = RegExp(r'^\d{3}$');
    if (!cvvRegex.hasMatch(cvv)) {
      return ValidatorsErrorStrings.invalidExpiryDate;
    }
    return null;
  }

  /// Expiry Date Validation
  static String? isValidExpiryDate(final String? expiryDate) {
    if (expiryDate == null) return null;
    if (expiryDate.isEmpty) {
      return ValidatorsErrorStrings.emptyError;
    }
    // Regular expression to match a valid expiry date in MM/YY format
    final RegExp expiryDateRegex = RegExp(r'^(0[1-9]|1[0-2])\/(\d{2})$');
    if (!expiryDateRegex.hasMatch(expiryDate)) {
      return ValidatorsErrorStrings.invalidExpiryDate;
    }

    // Split the input into month and year
    final List<String> parts = expiryDate.split('/');
    final int? month = int.tryParse(parts[0]);
    final int? year = int.tryParse(parts[1]);

    // Validate month (1-12) and year (current year or later)
    if (year == null || month == null) {
      return ValidatorsErrorStrings.invalidExpiryDate;
    }
    final DateTime now = DateTime.now();
    final int currentYear = now.year % 100;
    if (year < currentYear || (year == currentYear && month < now.month)) {
      return ValidatorsErrorStrings.invalidExpiryDate;
    }

    return null;
  }
}
