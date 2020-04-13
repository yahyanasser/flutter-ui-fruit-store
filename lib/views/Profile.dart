import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/DataStorage.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:fruit_store/views/ProfileCard.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    var badges=Provider.of<Api>(context);
    return Directionality(
          child: Scaffold(
body: ListView(
  
  children:[
        SizedBox(
              height: 20,
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
            SizedBox(height: 10,),
              Center(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0XFF558948))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  user.name,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )),
            
  Row(children: <Widget>[
      Expanded(child: ProfileCard(ontab:()=>
                        Navigator.pushNamed(context, '$cartViewRoute',arguments:<String, dynamic>{'cart':Provider.of<Api>(context,listen: false).cart,'product':Provider.of<Api>(context,listen: false).product })
      
      ,cardName:Language.vocabulary['cart'][lang.lang] ,icon: LineIcons.cart_arrow_down,color: Colors.grey[300],badge: badges.cart.length.toString(),badgeShow: badges.cart.length>0,)),
      Expanded(child: ProfileCard(ontab:()=>
       Navigator.pushNamed(context, '$order',arguments: true)

      ,cardName:Language.vocabulary['order'][lang.lang] ,icon: LineIcons.list_alt,color: Colors.grey[300],badge:badges.order.length.toString() ,badgeShow: badges.order.length>0,))

  ],),
  Row(children: <Widget>[
      Expanded(child: ProfileCard(cardName:Language.vocabulary['editprofile'][lang.lang] ,icon: LineIcons.edit,color: Colors.grey[300],ontab: ()=>
       Navigator.pushNamed(context, '$editProfile',),)),
      Expanded(child: ProfileCard(ontab: () async {
      Dialogs.DialogWaiting(context);
        user.id=-1;
        badges.order.clear();
        badges.cart.clear();
        badges.cartAndOrder.clear();
         DataStorage.setInt(DataStorage.idKey,-1);
        // await badges.getcartAndOrders(id)
       await badges.getuser();
       Navigator.pop(context);

      },cardName:Language.vocabulary['logout'][lang.lang] ,icon: LineIcons.sign_out,color: Colors.grey[300],))

  ],)
  
  ]),
      ), textDirection: lang.dir,
    );
  }
}