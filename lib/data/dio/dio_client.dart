import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_demo/connectivity/constants/constants.dart';

class DioClient {
  late String baseUrl;
  late Dio dio;
  late String token;

  DioClient(this.baseUrl, Dio dioC) {
    dio = dioC;
    token = AUTH_TOKEN;
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(milliseconds: 30000)
      ..options.receiveTimeout = Duration(milliseconds: 30000)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
  }

  void updateHeader(String _token) {
    //for updating headers dynamically
    _token = _token == null ? this.token : _token;
    this.token = _token;
    print('token param = ${_token}');
    print('this.token = ${this.token}');
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onRecieveProgress}) async {
    try {
      var response = await dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onReceiveProgress: onRecieveProgress,
      );
      print('Response body: ${response.data}');
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      throw e;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onRecieveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onReceiveProgress: onRecieveProgress,
        onSendProgress: onSendProgress,
      );
      print('Response body: ${response.data}');
      return response;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onRecieveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      var response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onReceiveProgress: onRecieveProgress,
        onSendProgress: onSendProgress,
      );
      print('Response body: ${response.data}');
      return response;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
      print('Response body: ${response.data}');
      return response;
    } on FormatException catch (_) {
      throw FormatException('Unable to process the data');
    } catch (e) {
      throw e;
    }
  }
}
