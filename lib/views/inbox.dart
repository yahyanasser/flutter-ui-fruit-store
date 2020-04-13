import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/models/inbox.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'Dialogs.dart';

class Inbox extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
   Widget deleteAll=Align( 
     alignment: Alignment.topLeft,
     child: 
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: RaisedButton.icon(
                                textColor: Colors.white,
                                elevation: 10,
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () async {
                                  Dialogs.DialogWaiting(context);
                          await        Provider.of<Api>(context,listen: false).deleteAllInbox();
                                  Navigator.pop(context);
                                },
                                icon: Icon(LineIcons.trash),
                                label: Text(Language.vocabulary['cancelall'][lang.lang])),
       ),);
    Widget body=Provider.of<Api>(context).inbox.length>0? ListView(
      children: <Widget>[deleteAll,
      Column(children: Provider.of<Api>(context).inbox.map((inbox)=>_buildInboxCard(inbox,context)).toList() ,)
      ],

      


    ):Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Icon(FontAwesomeIcons.mailBulk,color: Color(0XFF558948),size: 150,),),
      ),
    
      Center(child: Text(Language.vocabulary['emptyinbox'][lang.lang],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),)
    
    ],); 
    return Directionality(
          child: Scaffold(
body: body,
      ), textDirection: lang.dir,
    );
  }
    Widget _buildInboxCard(InboxModel inbox, BuildContext context) {
        var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Material(
        elevation: 54.0,
        shadowColor: Colors.white70,
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          // height: 120.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text(ar?inbox.contant_ar:inbox.contant,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
              IconButton(icon: Icon(Icons.close,color: Colors.red,), onPressed: () async {
                Dialogs.DialogWaiting(context);
              await  Provider.of<Api>(context,listen: false).removeinbox(inbox.id.toString());
                Navigator.pop(context);
              })
            ],
          )
        ),
      ),
    );
  }
}