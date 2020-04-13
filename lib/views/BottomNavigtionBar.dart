import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
var lang=    Provider.of<Language>(context);
     return
     BottomNavigationBar(
       onTap: (tab) async {
         Provider.of<NavBarIndex>(context,listen: false).setindex(tab);
tab==2&&user.id==-1?Dialogs.InfoDialog(context, '', 'Please log in first to view your orders'):null;
switch (tab) {
  case 1:
  if (user.id==-1) {
    
Dialogs.InfoDialog(context, '', 'Please log in first to view your orders');
  }else{
    Dialogs.DialogWaiting(context);
  await  Provider.of<Api>(context,listen: false).getcartAndOrders(user.id);
    Navigator.pop(context);
  }
    
    break;
  default:
}
       },
          currentIndex: Provider.of<NavBarIndex>(context,).currentIndex,
          selectedItemColor: Color(0XFF558948),
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              title: Text(
                Language.vocabulary['home'][lang.lang],
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
               BottomNavigationBarItem(

              icon: Badge(

              badgeColor: Color(0XFF558948),
              showBadge: Provider.of<Api>(context).order.length > 0,
              badgeContent: Text(
                Provider.of<Api>(context).order.length.toString(),
                style: TextStyle(color: Colors.white),),child: Icon( LineIcons.list_alt)),
              title: Text(
                Language.vocabulary['order'][lang.lang],
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              icon: Badge(

              badgeColor: Color(0XFF558948),
              showBadge: Provider.of<Api>(context).inbox.length > 0,
              badgeContent: Text(
                Provider.of<Api>(context).inbox.length.toString(),
                style: TextStyle(color: Colors.white),),child: Icon( FontAwesomeIcons.mailBulk)),
              title: Text(
                Language.vocabulary['inbox'][lang.lang],
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(

              icon: Icon(LineIcons.user),
              title: Text(
                Language.vocabulary['my'][lang.lang],
                style: TextStyle(
                    fontFamily: Fonts.primaryFont, fontWeight: FontWeight.bold),
              ),
            )
          ]);
  }
}