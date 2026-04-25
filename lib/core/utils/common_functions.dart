part of 'design_utils.dart';

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input.replaceFirst(input[0], input[0].toUpperCase());
}

bool isMobile() => Get.width < 600;

String getStringNonAlphanumericCharacters(String? category) {
  debugPrint("category: $category");
  if(category == null || category.isEmpty){
    return "";
  }
  // 1. Convert to lowercase
  String normalized = category.toLowerCase();
  // 2. Remove all non-alphanumeric characters (like spaces, underscores, hyphens)
  normalized = normalized.replaceAll(RegExp(r'[^a-z0-9]'), '');
  debugPrint("category normalized: $normalized");
  return normalized;
}
String capitalizeEachWord(String? text) {
  if (text == null || text.isEmpty) return "";
  return text
      .split(' ')
      .map((word) => word.isNotEmpty
      ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
      : '')
      .join(' ');
}

String generateRandomCode({int length = 4}) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rnd = Random();
  return List.generate(length, (index) => chars[rnd.nextInt(chars.length)]).join();
}

int getPercentageAmount({required double percentage, required int totalAmount}){
  double percentageAmount = 0;
  percentageAmount = (percentage * totalAmount)/100 ;
  return percentageAmount.toInt();
}

String maskEmail(String email) {
  if (!email.contains('@')) return email;

  final parts = email.split('@');
  final username = parts[0];
  final domain = parts[1];

  if (username.length <= 4) {
    return email; // too short to mask safely
  }

  final firstChar = username.substring(0, 1);
  final lastChars = username.substring(username.length - 3);
  final maskedLength = username.length - 4;

  return '$firstChar${'*' * maskedLength}$lastChars@$domain';
}

void navigateToScreen(String route) {
  Get.toNamed(route);
}



/// ================= SAFE PARSERS =================
int parseToInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  return int.tryParse(value.toString()) ?? 0;
}

double parseToDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

List<int> parseToIntList(dynamic value) {
  if (value is List) {
    return value.map((e) => parseToInt(e)).toList();
  }
  return [];
}

List<String> parseToStringList(dynamic value) {
  if (value is List) {
    return value.map((e) => parseToString(e)).toList();
  }
  return <String>[];
}

String parseToString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value.trim();
  return value.toString().trim();
}

bool parseToBool(dynamic value, {bool defaultValue = false}) {
  if (value == null) return defaultValue;
  if (value is bool) return value;

  if (value is String) {
    final str = value.trim().toLowerCase();

    // Positive cases
    if (str == 'true' || str == '1' || str == 'yes' || str == 'y' || str == 'on') {
      return true;
    }

    // Negative cases
    if (str == 'false' || str == '0' || str == 'no' || str == 'n' || str == 'off') {
      return false;
    }

    return defaultValue;
  }

  if (value is num) {
    return value != 0;
  }

  return defaultValue;
}

String getStatusString(String? value){
  String status = "";
  switch ((value ?? "").toUpperCase()) {
    case 'ACTIVE':
      status = "Active";
      break;
    case 'INACTIVE':
      status = "In Active";
      break;
    case 'ONDUTY':
      status = "On Duty";
      break;
    case 'OFFDUTY':
      status =  "Off Duty";
      break;
    case 'ASSIGNED':
      status =  "Assigned";
      break;
    default:
      status = "";
  }
  return status;
}

String getStatusSecondString(String? value){
  String status = "";
  switch ((value ?? "").toUpperCase()) {
    case 'AVAILABLE':
      status = "Available";
      break;
    case 'OCCUPIED':
      status = "Occupied";
      break;
    case 'RESERVED':
      status = "Reserved";
      break;
    case 'MAINTENANCE':
      status =  "Maintenance";
      break;
    default:
      status = "";
  }
  return status;
}

bool areListsEqual({required List<String> list1, required List<String> list2}) {
  // If lengths differ, they cannot be equal
  if (list1.length != list2.length) return false;

  // Convert to Sets to ignore order and check containment
  final set1 = list1.toSet();
  final set2 = list2.toSet();

  // If both sets have the same size and set1 contains all elements of set2,
  // they are equal (since sizes are equal, containment implies equality)
  return set1.length == set2.length && set1.containsAll(set2);
}

String formatNumber(int number) {
  final formatter = NumberFormat('#,##0');
  return formatter.format(number);
}

String toCapitalizedFirstChar(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1).toLowerCase();
}

String generateRandomNumber() {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

  String randomPart = String.fromCharCodes(
    Iterable.generate(
      5,
          (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );

  return randomPart;
}

String getInitialsString(String? input) {
  if (input == null) return '';
  if (input.isEmpty) return '';

  // Replace all non-letter characters with space
  String cleaned = input.replaceAll(RegExp(r'[^a-zA-Z]'), ' ');

  // Handle camelCase by adding space before uppercase letters
  cleaned = cleaned.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
        (match) => '${match.group(1)} ${match.group(2)}',
  );

  // Split into words
  List<String> words = cleaned
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();

  // Take first letter of each word
  String initials = words.map((w) => w[0].toUpperCase()).join();

  return initials;
}