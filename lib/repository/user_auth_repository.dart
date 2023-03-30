import 'package:dio/dio.dart';
import 'package:login_demo/connectivity/base/api_error_handler.dart';
import 'package:login_demo/connectivity/base/api_response.dart';
import 'package:login_demo/connectivity/constants/constants.dart';
import 'package:login_demo/data/dio/dio_client.dart';
import 'package:login_demo/res/app_url.dart';
import 'package:login_demo/res/helper.dart';

class UserAuthRepo {
  final DioClient client;

  UserAuthRepo({required this.client});

  Future<ApiResponse> userLogin(String? username, String? password) async {
    Map<String, dynamic> params = getRequestParams(true);
    params[USERNAME] = username;
    params[PASSWORD] = password;
    params[DEVICE_LATITUDE] = '72.02';
    params[DEVICE_LONGITUDE] = '23.02';

    print('userLogin: Request Parameter $params');
    try {
      Response response = await client.post(AppUrl.userLogin, data: params);
      print('userLogin: response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('userLogin: Api Response data Exceptions = $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> userLogout(int? loginUserId) async {
    Map<String, dynamic> params = getRequestParams(true);
    params[LOGIN_USER_ID] = loginUserId;

    print('userLogout: Request Parameter $params');
    try {
      Response response = await client.post(AppUrl.userLogout, data: params);
      print('userLogout: response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('userLogout: Api Response data Exceptions = $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> userProfileRegister(
      String? name, String? email, String? password) async {
    Map<String, dynamic> params = getRequestParams(false);
    params[NAME] = name;
    params[EMAIL] = email;
    params[PASSWORD] = password;

    print('userProfileRegister: Request Parameter $params');
    try {
      Response response =
          await client.post(AppUrl.userProfileUpdate, data: params);
      print('userProfileRegister: response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('userProfileRegister: Api Response data Exceptions = ${e}');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
