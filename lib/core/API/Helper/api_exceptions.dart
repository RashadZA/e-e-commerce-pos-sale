part of 'base_service.dart';

class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final dynamic response; // Add this field to store the full response

  ApiException([this.message, this.prefix, this.response]); // Include response in the constructor

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, dynamic response])
      : super(message, "", response);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, dynamic response])
      : super(message, "", response);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message, dynamic response])
      : super(message, "", response);
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message, dynamic response])
      : super(message, "", response);
}

class NotFoundException extends ApiException {
  NotFoundException([String? message, dynamic response])
      : super(message, "", response);
}

String getErrorMessageForDioErrors(DioException err) {
  switch (err.type) {
    case DioExceptionType.badResponse:
      return _returnResponseException(err.response);
    default:
      throw ApiException(err.message, '', err.response);
  }
}

dynamic _returnResponseException(Response? response) {
  debugPrint("response?.statusCode: ${response?.statusCode}");
  debugPrint("response?.data: ${response?.data}");
  switch (response?.statusCode) {
    case 400:
      throw BadRequestException(response?.data['message'] ?? response?.data['msg'] ?? response?.data['error'] ?? "", response);
    case 401:
      throw NotFoundException(response?.data['message'] ?? response?.data['msg'] ?? response?.data['error'] ?? "", response);
    case 403:
      throw UnauthorisedException(
          response?.data['message'] ?? response?.data['msg'] ?? response?.data['error'] ?? "",
          response
      );
    case 404:
      throw NotFoundException(response?.data['message'] ?? response?.data['msg'] ?? response?.data['error'] ?? "", response);
    case 500:
      throw FetchDataException(response?.data['message'] ?? response?.data['msg'] ?? response?.data['error'] ?? "", response);
    default:
      throw ApiException(
        response?.data["message"] ?? response?.data['msg'] ?? response?.data['error'] ?? "",
        '',
        response,
      );
  }
}