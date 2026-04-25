import 'dart:io';

class Internet {
  String? title;


  Internet({ this.title}) {
    title ??= 'No Internet Connection';
  }

  Future<bool> isAvailable() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }


}