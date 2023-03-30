import 'package:login_demo/connectivity/constants/constants.dart';

Map<String, dynamic> getRequestParams(bool isdeviceToken) {
  Map<String, dynamic> params = {
    'device_type': DEVICE_TYPE,
    'istoken': ISTOKEN,
    if (isdeviceToken) 'device_token': DEVICE_TOKEN,
  };

  return params;
}
