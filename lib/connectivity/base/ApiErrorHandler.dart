import 'package:dio/dio.dart';
import 'package:login_demo/connectivity/model/ErrorResponse.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";

    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;

            case DioErrorType.connectionTimeout:
              errorDescription = "Connection timeout with API Server";
              break;

            case DioErrorType.unknown:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;

            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Recieve timeout in connection with API Server";
              break;

            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 404:
                case 400:
                  errorDescription = error.response?.data;
                  break;
                case 500:
                case 503:
                  errorDescription = error.response?.statusMessage;
                  break;
                default:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response?.data);
                  if (errorResponse.list != null &&
                      errorResponse.list.length > 0) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription =
                        "Failed to load data - status code:${error.response?.statusCode}";
                  }
                  break;
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioErrorType.badCertificate:
              break;
            case DioErrorType.connectionError:
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not subtype of exception";
    }
    return errorDescription;
  }
}
