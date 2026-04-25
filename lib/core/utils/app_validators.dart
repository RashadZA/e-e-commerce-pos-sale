part of 'design_utils.dart';

String? emptyNullValidator(
    String? value, {
    String? errorMessage = "Required!",
  }) {
    //TODO: Add Extra Validation If Needed
    if (value?.trim().isEmpty ?? true) return errorMessage;
    return null;
}

String? passwordValidator(String? value) {
    //TODO: Add Extra Validation If Needed
    if (value == null || value.trim().isEmpty){
      return "Please enter a password";
    }
    else if(value.length < 9){
      return "Password must be at least 9 characters long";
    } else{
      return null;
    }
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Required!";
  }

  // Allow international format with optional + prefix
  // Remove all non-digits for validation
  String digitsOnly = value.replaceAll(RegExp(r'\D'), '');
  debugPrint("digitsOnly: $digitsOnly");

  // At least 10 digits, maximum reasonable limit
  if (!RegExp(r'^\d{10,20}$').hasMatch(digitsOnly)) {
    return "Please enter a valid phone number (10-20 digits)!";
  }

  return null;
}

String? amountValidator(String? value) {
    //TODO: Add Extra Validation If Needed
    if (value?.trim().isEmpty ?? true) {
      return "Required!";
    } else if (value != null && value.isNotEmpty && double.parse(value) < 1){
      return "Amount can't be smaller than 1!";
    }
    return null;
}

String? emailValidator(String? value) {
    //TODO: Add Extra Validation If Needed
    if (value == null || value.isEmpty) {
      return "Please enter email address";
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return "Invalid email format!";
    }
    return null;
}

// ID Card Number Validator (with dynamic validation based on card type)
String? idCardNumberValidator(String? value, String? idCardType) {
  if (value == null || value.isEmpty) {
    return "ID Card Number is required!";
  }

  switch (idCardType) {
    case "Aadharcard":
      if (!RegExp(r'^\d{12}$').hasMatch(value)) {
        return "Aadharcard Number must be 12 digits!";
      }
      break;

    case "VoterIdCard":
      if (!RegExp(r'^[A-Z]{3}[0-9]{7}$').hasMatch(value)) {
        return "VoterIdCard Number must be in the format AAA1111111!";
      }
      break;

    case "PanCard":
      if (!RegExp(r'^([A-Z]){5}([0-9]){4}([A-Z]){1}$').hasMatch(value)) {
        return "PanCard Number must be in the format ABCDE1234F!";
      }
      break;

    case "DrivingLicense":
    // Basic required validation - you can add specific pattern if needed
      if (value.isEmpty) {
        return "Driving License Number is required!";
      }
      break;

    default:
    // For other card types or when card type is not selected yet
      if (value.isEmpty) {
        return "ID Card Number is required!";
      }
      break;
  }

  return null;
}

/// India GST Validation
String? gstValidator(String? value) {
  // Empty Check
  if (value == null || value.isEmpty) {
    return "Please enter GST number";
  }

  // GST Format: 15 characters, alphanumeric, valid structure
  final gstRegExp = RegExp(
    r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
  );

  if (!gstRegExp.hasMatch(value.toUpperCase())) {
    return "Invalid GST number format!";
  }

  return null;
}

bool fieldIsEmpty(String value) {
  if (value.trim().isEmpty) {
    return true;
  } else{
    return false;
  }
}

bool fieldIsNotValidForAmount(String value) {
  if (value.trim().isEmpty) {
    return true;
  } else if (value.trim().isNotEmpty && (double.tryParse(value) ?? 0) <= 0) {
    return true;
  } else{
    return false;
  }
}


bool emailNotValid(String value) {
  // Define a regular expression for email validation
  final RegExp emailRegex = RegExp(
    r'^[^@]+@[^@]+\.[^@]+$',
    caseSensitive: false,
  );
  if (value.trim().isEmpty || !emailRegex.hasMatch(value)) {
    return true;
  } else{
    return false;
  }
}

bool phoneNumberNotValidator(String value) {
  // Define a regular expression for email validation
  final RegExp phoneNumberRegex = RegExp(
    r'^\+?[0-9]\d{1,10}$',
    caseSensitive: false,
  );
  if (value.trim().isEmpty || !phoneNumberRegex.hasMatch(value)) {
    return true;
  } else{
    return false;
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || o == false || o == "";
}