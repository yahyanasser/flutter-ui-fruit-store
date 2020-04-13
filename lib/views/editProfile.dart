import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  String _username = user.name;
  String _email;
  String _password=user.pass;
  String _passwordConfirm;
  String _address=user.address;
  String _phone=user.phone;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
      return Directionality(
        
              child: Scaffold(
          // backgroundColor: ,
          appBar: AppBar(elevation: 0,backgroundColor: Theme.of(context).scaffoldBackgroundColor,leading:   IconButton(
            icon: Icon(!ar ?LineIcons.long_arrow_left:LineIcons.long_arrow_right,color: Colors.black,),
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
          
            Center(
                  child: Container(
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Color(0XFF558948))),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Language.vocabulary['editprofile'][lang.lang],
                    style: TextStyle(fontSize: 50),
                  ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: TextFormField(
                onSaved: (value){
                  _username=value.isEmpty?user.name:value;
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
                    hintText: _username,
                    hintStyle: TextStyle(color: Colors.black),
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
                  _address=value.isEmpty?user.address:value;
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
                    hintText: _address,
                    hintStyle: TextStyle(color: Colors.black),

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
                  _phone=value.isEmpty?user.phone:value;
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
                    hintText: _phone,
                    hintStyle: TextStyle(color: Colors.black),

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
                  _password=value.isEmpty?user.pass:value;
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
                    hintText: '**************',
                    hintStyle: TextStyle(color: Colors.black),
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
                      Language.vocabulary['editprofile'][lang.lang],
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
                   
                      _formKey.currentState.save();
                      var editData={
                        'id':user.id.toString(),
                        'full_name':_username,
                        'mobile':_phone,
                        'address':_address,
                        'password':_password
                        };
    Dialogs.DialogWaiting(context);
await                    Provider.of<Api>(context,listen: false).editdata(editData);
Navigator.pop(context);
Dialogs.SuccssDialog(context: context,title: '',message: 'Edited successfully');

        // Scaffold
        //     .of(context)
        //     .showSnackBar(SnackBar(content: Text('Processing Data')));
    
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