import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/models/User.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:fruit_store/widgets/fruits.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Produects extends StatelessWidget {
  int product;
  Produects(this.product);
  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    Widget appbar=AppBar(leading: IconButton(icon: Icon(!ar ?LineIcons.long_arrow_left:LineIcons.long_arrow_right,color: Colors.black,), onPressed: (){Navigator.pop(context);}),elevation: 0,backgroundColor: Theme.of(context).scaffoldBackgroundColor,title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             
              Expanded(
                              child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15.0),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),actions: <Widget>[         IconButton(
          // icon: Icon(FontAwesomeIcons.thLarge),
          icon: Badge(
              badgeColor: Color(0XFF558948),
              showBadge: Provider.of<Api>(context).cart.length > 0,
              badgeContent: Text(
                Provider.of<Api>(context).cart.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                LineIcons.shopping_cart,
                color: Colors.black,
              )),
          onPressed: () {
          user.id == -1
                ? Dialogs.InfoDialog(context, '', 'Please Login Frist')
                : Navigator.pushNamed(context, '$cartViewRoute',
                    arguments: <String, dynamic>{
                        'cart': Provider.of<Api>(context, listen: false).cart,
                        'product':
                            Provider.of<Api>(context, listen: false).product
                      });
          },
        ),],);
         
                    return Directionality(child: Scaffold(appBar: appbar,body: FruitsWidget(product),), textDirection: lang.dir,);
  }

   


}