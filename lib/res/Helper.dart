import 'package:login_demo/connectivity/constants/Constants.dart';

Map<String, dynamic> getRequestParams(bool isdeviceToken) {
  Map<String, dynamic> params = {
    'device_type': Constants.DEVICE_TYPE,
    'istoken': Constants.ISTOKEN,
    if (isdeviceToken) 'device_token': Constants.DEVICE_TOKEN,
  };

  return params;
}
