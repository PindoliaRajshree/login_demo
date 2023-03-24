import 'package:dio/dio.dart';
import 'package:login_demo/connectivity/base/ApiErrorHandler.dart';
import 'package:login_demo/connectivity/base/ApiResponse.dart';
import 'package:login_demo/connectivity/constants/Constants.dart';
import 'package:login_demo/data/dio/DioClient.dart';
import 'package:login_demo/res/AppUrl.dart';
import 'package:login_demo/res/Helper.dart';

class UserAuthRepo {
  final DioClient client;

  UserAuthRepo({required this.client});

  Future<ApiResponse> userLogin(String? username, String? password) async {
    Map<String, dynamic> params = getRequestParams(true);
    params[Constants.USERNAME] = username;
    params[Constants.PASSWORD] = password;
    params[Constants.DEVICE_LATITUDE] = '72.02';
    params[Constants.DEVICE_LONGITUDE] = '23.02';

    print('Request Parameter $params');
    try {
      Response response = await client.post(AppUrl.userLogin, data: params);
      print('response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('Api Response data Exceptions = $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> userLogout(int? loginUserId) async {
    Map<String, dynamic> params = getRequestParams(true);
    params[Constants.LOGIN_USER_ID] = loginUserId;

    print('Request Parameter $params');
    try {
      Response response = await client.post(AppUrl.userLogout, data: params);
      print('response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('Api Response data Exceptions = $e');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> userProfileRegister(
      String? name, String? email, String? password) async {
    Map<String, dynamic> params = getRequestParams(false);
    params[Constants.NAME] = name;
    params[Constants.EMAIL] = email;
    params[Constants.PASSWORD] = password;

    print('Request Parameter $params');
    try {
      Response response =
          await client.post(AppUrl.userProfileUpdate, data: params);
      print('response.data=${response.data.toString()}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print('Api Response data Exceptions = ${e}');
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
