import 'package:fruit_store/_routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  
  int id;
static  String idKey= 'ID';
static  String  loginKey= 'LOGIN';
// static  String idKey= 'ID';

  List <String> cart=List();
static  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static var lang='lang';
  DataStorage(){
// await _ge
  }
_getISLogin() async {
        final SharedPreferences prefs = await _prefs;
islogin= prefs.getBool(loginKey)??false;
}

  getstring(key) async {
        final SharedPreferences prefs = await _prefs;

return  prefs.getString(key);
// cart=prefs.getStringList('cart');
    
  }
 static getid() async {
        final SharedPreferences prefs = await _prefs;

return user.id=prefs.getInt('ID')??-1;

  }
static setbool(key,value) async {
        final SharedPreferences prefs = await _prefs;
        prefs.setBool(key, value);

}
  getData() async {
    // await _getISLogin();
    // islogin?await _getID():null;

  }
  static setString(key,value) async {
        final SharedPreferences prefs = await _prefs;
        prefs.setString(key, value);

  } static setInt(key,value) async {
        final SharedPreferences prefs = await _prefs;
        prefs.setInt(key, value);

  }

  static getString(String key) async {
        final SharedPreferences prefs = await _prefs;
return prefs.getString(key)??'';
  }
  
}