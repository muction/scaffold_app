import 'package:shared_preferences/shared_preferences.dart';

class Tool{

  /// 获取缓存
  Future<String> cacheGetString(String key) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  /// 获取缓存
  Future<int> cacheGetInt(String key) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(key);
  }

}