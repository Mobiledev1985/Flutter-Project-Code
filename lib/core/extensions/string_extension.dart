import 'package:flutter/material.dart' show TimeOfDay, Color;

extension StringExtensions on String {
  /// Converts a string representation of time to a TimeOfDay object.
  /// The string should be in the format "hh:mm am/pm".
  TimeOfDay get stringToTimeOfDay {
    final cleanedTimeString =
        replaceAll('\u202F', ''); // Remove non-breaking space character
    int hour = int.parse(cleanedTimeString.split(':')[0]);
    final minute = cleanedTimeString.split(':').length > 1
        ? int.parse(cleanedTimeString.split(':')[1].substring(0, 2))
        : 0;
    final isAM = cleanedTimeString
            .substring(cleanedTimeString.length - 2)
            .toLowerCase() ==
        'am';

    if (!isAM && hour != 12) {
      hour += 12;
    } else if (isAM && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Converts a hexadecimal color string (e.g., "#RRGGBB" or "RRGGBB") to a Color object.
  Color get fromHex {
    final StringBuffer buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Checks if the string represents time in 24-hour format.
  bool get is24HourFormat {
    return !toLowerCase().contains('a');
  }
}
