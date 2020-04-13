import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  String _username;
  String _email;
  String _password;
  String _passwordConfirm;
  String _address;
  String _phone;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
      return Directionality(
              child: Scaffold(
          // backgroundColor: ,
          appBar: AppBar(elevation: 0,backgroundColor: Theme.of(context).scaffoldBackgroundColor,leading:   IconButton(
            icon: Icon(!ar? LineIcons.long_arrow_left:LineIcons.long_arrow_right,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),),
                body: Form(
                  key: _formKey,
                                child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
          
            // Container(
              
            //   decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   shape: BoxShape.rectangle,
            //   border: Border.all(color: Color(0XFF558948))),
            //   child: Padding(
            // padding: const EdgeInsets.all(8.0),
            // child: Center(
            //             child: Text(
            //      Language.vocabulary['signin'][lang.lang],
            //     style: TextStyle(fontSize: 50),
            //   ),
            // ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: TextFormField(
                onSaved: (value){
                  _username=value;
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
                        'assets/images/ic_user.png',
                        color: Color(0XFF558948),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    hintText:  Language.vocabulary['username'][lang.lang],
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Color(0XFF558948))),
                  ),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),  Padding(
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
                    hintText:  Language.vocabulary['email'][lang.lang],
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Color(0XFF558948))),
                  ),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ), Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: TextFormField(
                  onSaved: (value){
                  _address=value;
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
                        'assets/images/ic_house.png',
                        color: Color(0XFF558948),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    hintText:  Language.vocabulary['address'][lang.lang],
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Color(0XFF558948))),
                  ),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: TextFormField(
                  onSaved: (value){
                  _phone=value;
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
                        'assets/images/ic_phone.png',
                        color: Color(0XFF558948),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    hintText: Language.vocabulary['phone'][lang.lang],
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
    onChanged: (value){
                  _password=value;

                },
                  validator: (value) {
    if (value.isEmpty||_password!=_passwordConfirm) {
        return 'Not Matched';
    }else if (_password.length<8) {
        return 'Must Be 8 characters or more';
        
    }
    return null;
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
                    hintText:  Language.vocabulary['pass'][lang.lang],
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Color(0XFF558948))),
                  ),
                  obscureText: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),     Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: TextFormField(
                  onChanged: (value){
                  _passwordConfirm=value;

                },
                  validator: (value) {
    if (value.isEmpty||_password!=_passwordConfirm) {
        return 'Not Matched';
    }
    return null;
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
                    hintText: Language.vocabulary['pass1'][lang.lang],
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
                      Language.vocabulary['signin'][lang.lang],
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
                      var signUpData={
                        'EMAIL':_email,
                        'full_name':_username,
                        'mobile':_phone,
                        'address':_address,
                        'PASS':_password
                        };
    Dialogs.DialogWaiting(context);
await                    Provider.of<Api>(context,listen: false).signup(signUpData);
Navigator.pop(context);
if (Provider.of<Api>(context,listen: false).statu) {
  

if (Provider.of<Api>(context,listen: false).isuserExist) {
  Dialogs.InfoDialog(context, 'Warning', 'This Email This user already exists');
  
}else{
  Dialogs.SuccssDialog(context: context,title:'succeeded',message: 'Your account has been registered, please log in' ,onclick: ()=>Navigator.pop(context));
}}else{
  Dialogs.ErrorDialog(context, 'error', 'There is no internet');
}

        // Scaffold
        //     .of(context)
        //     .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
                    },
                  ),
              ),
            ),
            
          ],
    ),
                ),
        ), textDirection: lang.dir,
      );
  }
}