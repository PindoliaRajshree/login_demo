import 'package:flutter/cupertino.dart';
import 'package:login_demo/connectivity/base/api_response.dart';
import 'package:login_demo/connectivity/constants/constants.dart';
import 'package:login_demo/connectivity/model/user.dart';
import 'package:login_demo/repository/user_auth_repository.dart';

class UserAuthProvider with ChangeNotifier {
  final UserAuthRepo userAuthRepo;

  UserAuthProvider({required this.userAuthRepo});

  User? user;

  bool loader = false;

  Future getRegisterUser(
      String? name, String? email, String? password, Function callback) async {
    loader = true;
    notifyListeners();
    try {
      ApiResponse apiResponse =
      await userAuthRepo.userProfileRegister(name, email, password);
      print(
          'UserRegister: ApiResponse.Data.success ${apiResponse.response?.data.toString()}');

      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
        loader = false;
        notifyListeners();
        Map map = apiResponse.response!.data;
        print(
            'Provider: UserRegister: apiResponse.response?.Map.Data = ${map['data']}');

        if (map[ERROR] == true) {
          loader = false;
          notifyListeners();
          callback(null, map['message'], true);
        } else {
          loader = false;
          notifyListeners();
          user = User.fromJson(map['data']);
          print('Provider: UserRegister: ${user!.toJson().toString()}');
          callback(map['data'], map['message'], false);
        }
      } else {
        loader = false;
        notifyListeners();
        print(
            'Provider: UserRegister - apiResponse.Error = ${apiResponse.error}');
        Map map = apiResponse.error;
        callback(null, map['message'], true);
        notifyListeners();
      }
    } catch (e) {
      loader = false;
      notifyListeners();
      print(
          'Provider: UserRegister - apiResponse.response?.Exception = ${e.toString()}');
      callback(null, e.toString(), true);
    }
  }

  Future UserLogout(int? loginUserID, Function callback) async {
    loader = true;
    notifyListeners();
    try {
      ApiResponse apiResponse = await userAuthRepo.userLogout(loginUserID);
      print(
          'UserLogout: ApiResponse.Data.success ${apiResponse.response?.data.toString()}');

      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
        loader = false;
        notifyListeners();
        Map map = apiResponse.response!.data;
        print(
            'Provider: UserLogout: apiResponse.response?.Map.Data = ${map['data']}');

        if (map[ERROR] == true) {
          loader = false;
          notifyListeners();
          callback(null, map['message'], true);
        } else {
          loader = false;
          notifyListeners();
          user = User.fromJson(map['data']);
          print('Provider: UserLogout: ${user!.toJson().toString()}');
          callback(map['data'], map['message'], false);
        }
      } else {
        loader = false;
        notifyListeners();
        print(
            'Provider: UserLogout - apiResponse.Error = ${apiResponse.error}');
        Map map = apiResponse.error;
        callback(null, map['message'], true);
        notifyListeners();
      }
    } catch (e) {
      loader = false;
      notifyListeners();
      print(
          'Provider: UserLogout - apiResponse.response?.Exception = ${e.toString()}');
      callback(null, e.toString(), true);
    }
  }

  Future UserLogin(
      String? username, String? password, Function callback) async {
    loader = true;
    notifyListeners();
    try {
      ApiResponse apiResponse =
      await userAuthRepo.userLogin(username, password);
      print(
          'UserLogin: ApiResponse.Data.success ${apiResponse.response?.data.toString()}');

      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
        loader = false;
        notifyListeners();
        Map map = apiResponse.response!.data;
        print(
            'Provider: UserLogin: apiResponse.response?.Map.Data = ${map['data']}');

        if (map[ERROR] == true) {
          loader = false;
          notifyListeners();
          callback(null, map['message'], true);
        } else {
          loader = false;
          notifyListeners();
          user = User.fromJson(map['data']);
          print('Provider: UserLogin: ${user!.toJson().toString()}');
          callback(map['data'], map['message'], false);
        }
      } else {
        loader = false;
        notifyListeners();
        print('Provider: UserLogin - apiResponse.Error = ${apiResponse.error}');
        Map map = apiResponse.error;
        callback(null, map['message'], true);
        notifyListeners();
      }
    } catch (e) {
      loader = false;
      notifyListeners();
      print(
          'Provider: UserLogin - apiResponse.response?.Exception = ${e.toString()}');
      callback(null, e.toString(), true);
    }
  }
}
