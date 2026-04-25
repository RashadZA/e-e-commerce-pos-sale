part of 'design_utils.dart';

/// User token SharedPreferences Part Start
Future<void> savedToken(String? value) async {
  await deleteToken();
  debugPrint('stanyClinicManagementSystemToken value==== $value');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != null) {
    await prefs.setString('stanyClinicManagementSystemToken', value);
    debugPrint('saved stanyClinicManagementSystemToken====');
  }
}

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? getToken = prefs.getString('stanyClinicManagementSystemToken');
  debugPrint('get stanyClinicManagementSystemToken==== $getToken');
  return getToken ?? "";
}

Future<void> deleteToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemToken');
  debugPrint('saved stanyClinicManagementSystemToken====');
}

/// User token SharedPreferences Part End



/// User Id SharedPreferences Part Start
Future<void> savedUserId(String? userId) async {
  await deleteUserId();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (userId != null) {
    await prefs.setString('stanyClinicManagementSystemUserId', userId);
    debugPrint('saved stanyClinicManagementSystemUserId====');
  }
}


Future<String> getUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('stanyClinicManagementSystemUserId');
  return userId ?? "";
}

Future<void> deleteUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemUserId');
  debugPrint('delete stanyClinicManagementSystemUserId====');
}
/// User Id SharedPreferences Part End



/// User Id SharedPreferences Part Start
Future<void> savedClinicId(String? userId) async {
  await deleteClinicId();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (userId != null) {
    await prefs.setString('stanyClinicManagementSystemClinicId', userId);
    debugPrint('saved stanyClinicManagementSystemClinicId====');
  }
}
Future<void> savedClinicCurrency(String? currency) async {
  await deleteClinicCurrency();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (currency != null) {
    await prefs.setString('stanyClinicManagementSystemClinicCurrency', currency);
    debugPrint('saved stanyClinicManagementSystemClinicCurrency====');
  }
}


Future<String> getClinicId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('stanyClinicManagementSystemClinicId');
  return userId ?? "";
}

Future<String> getClinicCurrency() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userCurrency = prefs.getString('stanyClinicManagementSystemvCurrency');
  return userCurrency ?? "";
}

Future<void> deleteClinicId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemClinicId');
  debugPrint('delete stanyClinicManagementSystemClinicId====');
}
Future<void> deleteClinicCurrency() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemClinicCurrency');
  debugPrint('delete stanyClinicManagementSystemClinicCurrency====');
}
/// User Id SharedPreferences Part End




/// User details SharedPreferences Part Start
Future<void> savedUserName(String? value) async {
  await deleteUserName();
  debugPrint(' stanyClinicManagementSystemUserName value==== $value');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != null) {
    await prefs.setString('stanyClinicManagementSystemUserName', value);
    debugPrint('saved stanyClinicManagementSystemUserName====');
  }
}

Future<void> savedUserEmail(String? value) async {
  await deleteUserEmail();
  debugPrint('stanyClinicManagementSystemUserEmail value==== $value');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != null) {
    await prefs.setString('stanyClinicManagementSystemUserEmail', value);
    debugPrint('saved stanyClinicManagementSystemUserName====');
  }
}

Future<void> savedUserPassword(String? value) async {
  await deleteUserPassword();
  debugPrint('stanyClinicManagementSystemUserPassword value==== $value');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != null) {
    await prefs.setString('stanyClinicManagementSystemUserPassword', value);
    debugPrint('saved stanyClinicManagementSystemUserPassword====');
  }
}

Future<void> savedUserRememberMe(bool value) async {
  await deleteUserRememberMe();
  debugPrint(' stanyClinicManagementSystemUserRememberMe value==== $value');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('stanyClinicManagementSystemUserRememberMe', value);
  debugPrint('saved userRememberMe====');
}


Future<String> getUserName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? getToken = prefs.getString('stanyClinicManagementSystemUserName');
  debugPrint('get stanyClinicManagementSystemUserName==== $getToken');
  return getToken ?? "";
}

Future<String> getUserEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? getToken = prefs.getString('stanyClinicManagementSystemUserEmail');
  debugPrint('get stanyClinicManagementSystemUserEmail==== $getToken');
  return getToken ?? "";
}

Future<String> getUserPassword() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? getToken = prefs.getString('stanyClinicManagementSystemUserPassword');
  debugPrint('get stanyClinicManagementSystemUserPassword==== $getToken');
  return getToken ?? "";
}

Future<bool> getUserRememberMe() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? getToken = prefs.getBool('stanyClinicManagementSystemUserRememberMe');
  debugPrint('get stanyClinicManagementSystemUserRememberMe==== $getToken');
  return getToken ?? false;
}


Future<void> deleteUserName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemUserName');
  debugPrint('saved stanyClinicManagementSystemUserName====');
}

Future<void> deleteUserRememberMe() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemUserRememberMe');
  debugPrint('saved stanyClinicManagementSystemUserPassword====');
}

Future<void> deleteUserPassword() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemUserPassword');
  debugPrint('saved stanyClinicManagementSystemUserPassword====');
}

Future<void> deleteUserEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('stanyClinicManagementSystemUserEmail');
  debugPrint('saved stanyClinicManagementSystemUserEmail====');
}

/// Pharmacy Id SharedPreferences Part end
///
class CurrencyService {
  static String? _cachedCurrency;

  /// Load currency once (call this in app start)
  static Future<void> loadCurrency() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _cachedCurrency =
        prefs.getString('stanyClinicManagementSystemClinicClinicCurrency') ?? "USD";
  }

  /// Access currency anywhere in the app
  static String get currency {
    assert(_cachedCurrency != null, 'Currency not loaded yet. Call loadCurrency() first.');
    return _cachedCurrency!;
  }
}