part of 'design_utils.dart';

String getDMMMMYYYYHMMAFormatFromString(String dateString) {
  String formattedDate = "";
  final formatter = DateFormat('d MMMM yyyy h:mm a');
  if(parseDateAnyDateFormatString(dateString) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
  }else {
    formattedDate = "";
  }
  return formattedDate; // Format as "10 March 2025 2:40 PM"
}

String getMMMMYYYYFormatFromMonthAndYearString(String dateStr) {
  DateTime date = DateTime.parse('$dateStr-01');
  String formattedDate = DateFormat('MMMM yyyy').format(date);
  return formattedDate;
}

String getYYYYMMDDFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}

String getMMDDYYYYFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat('MM/dd/yyyy').format(date);
  return formattedDate;
}

String getDDMMYYYYFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
}

String getYYYYMMDDFormatFromString(String dateString) {
  String formattedDate = "";
  final formatter = DateFormat('yyyy-MM-dd');
  if(parseDateAnyDateFormatString(dateString) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
  }else {
    formattedDate = "";
  }
  return formattedDate;
}

String getDDMMYYYYHMMAFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat("dd-MM-yyyy hh:mm a").format(date);
  return formattedDate; // Format as "10 March 2025 2:40 PM"
}

String getMMDDYYYYFormatFromString(String dateString) {
  String formattedDate = "";
  final formatter = DateFormat('MM/dd/yyyy');
  if(parseDateAnyDateFormatString(dateString) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
  }else {
    formattedDate = "";
  }
  return formattedDate;
}

String getDDMMYYYYFormatFromString(String dateString) {
  String formattedDate = "";
  final formatter = DateFormat('dd-MM-yyyy');
  if(parseDateAnyDateFormatString(dateString) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
  }else {
    formattedDate = "";
  }
  return formattedDate;
}

String getDMMMYYYYFormatFromString(String dateString) {
  if(dateString.isEmpty || dateString == "mm/dd/yyyy"|| dateString == "MMMM yyyy"|| dateString == "yyyy-MM-dd"|| dateString == "MM/dd/yyyy" || dateString == "d MMM yyyy"){
    return dateString;
  } else {
    String formattedDate = "";
    final formatter = DateFormat('d MMM yyyy');
    if(parseDateAnyDateFormatString(dateString) != null){
      formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
    }else {
      formattedDate = "";
    }
    return formattedDate;
  }
}

String getDMMYYYYFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat('d MMM yyyy').format(date);
  return formattedDate;
}

String getDMMMYYYYFormatFromAnyDateFormatString(String dateString) {
  // final DateTime date = parseDateAnyDateFormatString(dateString);
  String formattedDate = "";
  final formatter = DateFormat('d MMM yyyy');
  if(parseDateAnyDateFormatString(dateString) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(dateString)!);
  }else {
    formattedDate = "";
  }
  return formattedDate;
}

DateTime? parseDateAnyDateFormatString(String dateString) {
  try {
    debugPrint("parseDateAnyDateFormatString: $dateString");

    // DateTime.parse auto-detects timezone
    final parsed = DateTime.parse(dateString);

    // Convert to local time if needed
    return parsed.isUtc ? parsed.toLocal() : parsed;
  } catch (_) {
    // List of fallback formats
    final formats = [
      DateFormat("MMMM yyyy"),
      DateFormat("yyyy-MM-dd"),
      DateFormat("MM/dd/yyyy"),
      DateFormat("d MMM yyyy"),
    ];

    for (final format in formats) {
      try {
        // Parse as UTC then convert to local
        final parsed = format.parse(dateString, true);
        return parsed.toLocal();
      } catch (_) {}
    }

    return null;
  }
}

String getTimeFrom24HourTo12HourFormat(String time24Hour) {
  if(time24Hour.isEmpty){
    return "";
  } else{
    // Parse the 24-hour format time
    DateTime parsedTime = DateFormat("HH:mm:ss").parse(time24Hour);

    // Convert to 12-hour format with AM/PM
    String time12Hour = DateFormat("hh:mm a").format(parsedTime);
    return time12Hour;
  }
}


String getMMMMDDYYYYHHMMAFormatFromDateTime(DateTime date) {
  String formattedDate = DateFormat('MMMM dd, yyyy hh:mm a').format(date);
  return formattedDate;
}

String getDateTimeStringFormatFromString(String dateString) {
  if(dateString.isEmpty || dateString == "mm/dd/yyyy"|| dateString == "MMMM yyyy"|| dateString == "yyyy-MM-dd"|| dateString == "MM/dd/yyyy" || dateString == "d MMM yyyy"){
    return "";
  } else {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat("MM/dd/yyyy");
    try {
      // US format MM/DD/YYYY
      dateTime = dateFormat.parse(dateString);
      // debugPrint("US format MM/DD/YYYY Parsed date: $dateTime");
    } catch (e) {
      DateFormat dateFormat = DateFormat("mm/dd/yyyy");
      try {
        // US format mm/dd/yyyy
        dateTime = dateFormat.parse(dateString);
        // debugPrint("Format mm/dd/yyyy Parsed date: $dateTime");
      } catch (e) {
        DateFormat dateFormat = DateFormat("MMMM yyyy");
        try {
          // US format MMMM yyyy
          dateTime = dateFormat.parse(dateString);
          // debugPrint("Format MMMM yyyy Parsed date: $dateTime");
        } catch (e) {
          DateFormat dateFormat = DateFormat("yyyy-MM-dd");
          try {
            // US format MMMM yyyy
            dateTime = dateFormat.parse(dateString);
            // debugPrint("Format MMMM yyyy Parsed date: $dateTime");
          } catch (e) {
            DateFormat dateFormat = DateFormat("d MMM yyyy");
            try {
              // US format MMMM yyyy
              dateTime = dateFormat.parse(dateString);
              // debugPrint("Format d MMM yyyy Parsed date: $dateTime");
            } catch (e) {
              // debugPrint("Format d MMM yyyy Error parsing date: $e");
            }
            // debugPrint("Format yyyy-MM-dd Error parsing date: $e");
          }
          // debugPrint("Format MMMM yyyy Error parsing date: $e");
        }
        // debugPrint("Format mm/dd/yyyy Error parsing date: $e");
      }
      // debugPrint("Format MM/dd/yyyy Error parsing date: $e");
    }
    return dateTime.toString();
  }
}


/// Convert string into DateTime format
DateTime getDateTimeFormatFromString(String dateString) {
  if(dateString.isEmpty || dateString == "mm/dd/yyyy"|| dateString == "MMMM yyyy"|| dateString == "yyyy-MM-dd"|| dateString == "MM/dd/yyyy" || dateString == "d MMM yyyy"){
    return DateTime.now();
  } else {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat("MM/dd/yyyy");
    try {
      // US format MM/DD/YYYY
      dateTime = dateFormat.parse(dateString);
      // debugPrint("US format MM/DD/YYYY Parsed date: $dateTime");
    } catch (e) {
      DateFormat dateFormat = DateFormat("mm/dd/yyyy");
      try {
        // US format mm/dd/yyyy
        dateTime = dateFormat.parse(dateString);
        // debugPrint("Format mm/dd/yyyy Parsed date: $dateTime");
      } catch (e) {
        DateFormat dateFormat = DateFormat("MMMM yyyy");
        try {
          // US format MMMM yyyy
          dateTime = dateFormat.parse(dateString);
          // debugPrint("Format MMMM yyyy Parsed date: $dateTime");
        } catch (e) {
          DateFormat dateFormat = DateFormat("yyyy-MM-dd");
          try {
            // US format MMMM yyyy
            dateTime = dateFormat.parse(dateString);
            // debugPrint("Format MMMM yyyy Parsed date: $dateTime");
          } catch (e) {
            DateFormat dateFormat = DateFormat("d MMM yyyy");
            try {
              // US format MMMM yyyy
              dateTime = dateFormat.parse(dateString);
              // debugPrint("Format d MMM yyyy Parsed date: $dateTime");
            } catch (e) {
              // debugPrint("Format d MMM yyyy Error parsing date: $e");
            }
            // debugPrint("Format yyyy-MM-dd Error parsing date: $e");
          }
          // debugPrint("Format MMMM yyyy Error parsing date: $e");
        }
        // debugPrint("Format mm/dd/yyyy Error parsing date: $e");
      }
      // debugPrint("Format MM/dd/yyyy Error parsing date: $e");
    }
    return dateTime;
  }
}

String getDayName(String dateString) {
  DateTime date = getDateTimeFormatFromString(dateString); // Parse string to DateTime
  String dayName = DateFormat('EEEE').format(date); // Get day name
  return dayName;
}


/// Calculate total days from string
int getTotalDaysFromString({required String dateStringOne, required String dateStringTwo}) {
  final dateOne = DateTime.parse(dateStringOne);
  final dateTwo = DateTime.parse(dateStringTwo);
  Duration difference = dateTwo.difference(dateOne);
  return (difference.inDays+1);
}

/// Calculate total days from string
String getMonthAndDateDifference({required String dateString}) {
  // Define the given date
  DateTime givenDate = DateTime.parse(dateString);

  // Get the current date
  DateTime today = DateTime.now();

  // Calculate the difference in days
  int daysDifference = today.difference(givenDate).inDays;

  // Calculate the difference in months (approximate)
  int monthsDifference = ((today.year - givenDate.year) * 12) + (today.month - givenDate.month);

  // Print the results
  debugPrint("Days difference: $daysDifference days");
  debugPrint("Months difference: $monthsDifference months");
  return "$monthsDifference months, $daysDifference days";
}

/// Calculate total days from DateTime
int getTotalDaysFromDateTime({required DateTime dateStringOne, required DateTime dateStringTwo}) {
  Duration difference;
  if(dateStringTwo.isAfter(dateStringOne)){
    difference = dateStringTwo.difference(dateStringOne);
  }else{
    difference = dateStringOne.difference(dateStringTwo);
  }
  return difference.inDays > 1 ? difference.inDays : 1;
}

/// Convert TimeOfDay to a formatted string
String getFormatTimeFromTimeOfDay(TimeOfDay time, {bool showAmPm = true}) {
  final now = DateTime.now();
  final dateTime = DateTime(
      now.year, now.month, now.day, time.hour, time.minute);

  // Choose format based on showAmPm flag
  return showAmPm ? DateFormat('hh:mm a').format(dateTime) : DateFormat('HH:mm a').format(dateTime);
}

/// Convert TimeOfDay to a formatted string of h:mm a
String get12HourFormatTimeFromTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime = DateTime(
      now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('HH:mm').format(dateTime); // Format as 'h:mm a'
}

/// Convert TimeOfDay to a formatted string of h:mm a
String get24HourFormatTimeFromTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime = DateTime(
      now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('hh:mm a').format(dateTime); // Format as 'h:mm a'
}

/// Convert TimeOfDay to a formatted string of h:mm a
String get12HourFormatTimeFromDateTimeString(String? time) {
  String formattedDate = "";
  if(time == null){
    return "";
  }
  final formatter = DateFormat('hh:mm a');
  if(parseDateAnyDateFormatString(time) != null){
    formattedDate = formatter.format(parseDateAnyDateFormatString(time)!);
  }
  return formattedDate; // Format as 'h:mm a'
}

/// Convert a formatted string to a formatted string
TimeOfDay getTimeOfDayFromString(String time) { // or "16:22", any format
  TimeOfDay timeOfDay;
  try {
    // Try parsing in 24-hour format (HH:mm)
    DateTime tempDate24Hour = DateFormat("HH:mm").parse(time);
    timeOfDay = TimeOfDay.fromDateTime(tempDate24Hour);
  } catch (e) {
    // If 24-hour format fails, try parsing in 12-hour format (hh:mm a)
    try {
      DateTime tempDate12Hour = DateFormat("hh:mm a").parse(time);
      timeOfDay = TimeOfDay.fromDateTime(tempDate12Hour);
    } catch (e) {
      // Handle the error or set a default value
      timeOfDay = const TimeOfDay(hour: 0, minute: 0); // default to midnight
    }
  }

  return timeOfDay; // Output: TimeOfDay(16, 22) or whatever the correct time is
}

String convertLocalTimeOfDayToUtcIso({required TimeOfDay time, required DateTime date}) {

  // Create local DateTime from TimeOfDay
  final localDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );

  // Convert to UTC
  final utcDateTime = localDateTime.toUtc();

  // Return ISO 8601 format with Z
  return utcDateTime.toIso8601String();
}