import '../utils/sharepreference_helper.dart';

class StaticData {
  static String accessToken = '';
  static String refreshToken = '';
  static String uid = SharedPreferencesHelper.getString('userId') ?? '';
  static String name = SharedPreferencesHelper.getString('name') ?? '';
  static String email = SharedPreferencesHelper.getString('email') ?? '';
  static String phoneNo = SharedPreferencesHelper.getString('phoneNo') ?? '';
  static String imagePath =
      SharedPreferencesHelper.getString('imagePath') ?? '';
  static String type = SharedPreferencesHelper.getString('type') ?? '';
  static String location = SharedPreferencesHelper.getString('location') ?? '';
  static String country = SharedPreferencesHelper.getString('country') ?? '';
}
