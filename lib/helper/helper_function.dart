import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // keys

  static String userLoggedInkey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = 'USEREMAILKEY';

// saving data to sf
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(userLoggedInkey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameStatus(String userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailStatus(String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userEmailKey, userEmail);
  }

// getting data from sf

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoggedInkey);
  }

  static Future<String?> getUserEmailfromSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userEmailKey);
  }

  static Future<String?> getUserNamefromSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userNameKey);
  }
}
