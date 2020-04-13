import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/DataStorage.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
    String _email;
  String _password;
static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context,);
    bool ar=lang.lang=='ar';
    return Form(
      key: _formKey,
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Color(0XFF558948))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Center(
                    child: Image.asset(
                  'assets/images/login.png',
                  width: 120,
                  height: 120,
                )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                border: Border.all(color: Color(0XFF558948))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Language.vocabulary['login'][lang.lang],
                style: TextStyle(fontSize: 50),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: TextFormField(
                onSaved: (value){
                  _email=value;
                },
                validator: (value) {
      if (value.isEmpty) {
        return 'error';
      }
      return null;
  },
              
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 30.0,
                  height: 30.0,
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/ic_email.png',
                    color: Color(0XFF558948),
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                hintText: Language.vocabulary['email'][lang.lang],
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color(0XFF558948))),
              ),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: TextFormField(
              onSaved: (value){
                  _password=value;
                },
                validator: (value) {
      if (value.isEmpty) {
        return 'error';
      }
      return null;
  },
              onChanged: (value) {
                // password = value;
              },
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 30.0,
                  height: 30.0,
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/ic_padlock.png',
                    width: 20.0,
                    height: 20.0,
                    color: Color(0XFF558948),
                  ),
                ),
                hintText: Language.vocabulary['pass'][lang.lang],
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color(0XFF558948))),
              ),
              obscureText: true,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: SizedBox(
              height: 45,
              child: RaisedButton(
                child: Text(
                   Language.vocabulary['login'][lang.lang],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0XFF558948),
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                    side: BorderSide(color: Color(0XFF558948))),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                     _formKey.currentState.save();
                    var logindata={
'email':_email,
'password':_password

                    };
                      Dialogs.DialogWaiting(context);
await                    Provider.of<Api>(context,listen: false).login(logindata);
Navigator.pop(context);
if (Provider.of<Api>(context,listen: false).statu) {
  if (Provider.of<Api>(context,listen: false).wrongpass) {
    Dialogs.ErrorDialog(context, 'Error', 'Wrong Email Or Password');
    
  }
  else{
        DataStorage.setInt(DataStorage.idKey,user.id);
        // DataStorage.setbool(true, DataStorage.loginKey);
        // Useridid=Provider.of<Api>(context,listen: false).userid;
        islogin=true;
        // Navigator.pushNamedAndRemoveUntil(context, profile, (Route<dynamic> route) => false);
    // print('object');
  }
  
}
                  }
                  // Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ),
          Center(
              child: GestureDetector(
                onTap:()=> Navigator.pushNamed(context, signuppage),
                            child: RichText(
            text: TextSpan(

                  children: [
                    TextSpan(

                        text: '  '+ Language.vocabulary['signin'][lang.lang],
                        style: TextStyle(
                            color: Color(0XFF558948), fontWeight: FontWeight.bold,decorationStyle: TextDecorationStyle.solid,decorationColor: Color(0XFF558948),decoration: TextDecoration.underline),)
                  ],
                  text:  Language.vocabulary['haveacc'][lang.lang],
                  style: TextStyle(fontSize: 15, color: Colors.black38)),
          ),
              ))
        ],
      ),
    );
  }
}
