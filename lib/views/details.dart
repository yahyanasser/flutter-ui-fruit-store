import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/widgets/rating_bar.dart';
import 'package:provider/provider.dart';

import 'Dialogs.dart';

class FruitAppFruitDetails extends StatelessWidget {
  final Product fruit;
  const FruitAppFruitDetails({Key key, this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0XFFABC4A5),),/////////////////////////
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      fruit.name,
                      style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     // RatingBar(
                    //     //   rating: fruit.rating,
                    //     // ),
                    //     Text(
                    //       fruit.rating.toString(),
                    //       style: TextStyle(
                    //         color: Colors.grey.withOpacity(0.6),
                    //         fontFamily: Fonts.primaryFont,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 18.0,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        fruit.description,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: Fonts.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  LineIcons.long_arrow_left,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child:  IconButton(
                color: Colors.white,
                // icon: Icon(FontAwesomeIcons.thLarge),
                icon: Badge(showBadge: Provider.of<Api>(context).cart.length>0,badgeContent:Text(Provider.of<Api>(context).cart.length.toString(),style: TextStyle(color: Colors.white),) ,child: Icon(LineIcons.shopping_cart)),
                onPressed: () {
                  if(user.id==-1){
Navigator.pop(context);
                Provider.of<NavBarIndex>(context,listen: false).setindex(2);
                  }
                  else
                  Navigator.pushNamed(context, '$cartViewRoute',arguments:<String, dynamic>{'cart':Provider.of<Api>(context,listen: false).cart,'product':Provider.of<Api>(context,listen: false).product});                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 5,
            child: Hero(
              tag: fruit.id,
              child: Image.network(
           ImageUrl+fruit.image,
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                   fruit.price!=0?
                  RichText(

                   text: TextSpan(children: [
                    
                     TextSpan(children: [TextSpan(text:  '\$${fruit.price}',
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: Fonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),),TextSpan(text:  ' For one',
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: Fonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0, ))])
                   ]),
                  ):SizedBox(),
                   fruit.priceG!=0?
                  RichText(

                   text: TextSpan(children: [
                    
                     TextSpan(children: [TextSpan(text:  '\$${fruit.priceG}',
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: Fonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),),TextSpan(text:  ' For Gram',
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: Fonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0, ))])
                   ]),
                  ):SizedBox()
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () async {
                if(user.id==-1){
Navigator.pop(context);
                Provider.of<NavBarIndex>(context,listen: false).setindex(2);
                }
                
                else{
var info={
                  'id':user.id.toString(),
                  'status':'0',
                  'qty':fruit.price==0?"0": '1',
                  'qtyG':fruit.priceG==0?"0":"250",
                  'product_id':fruit.id.toString()

                };
                Dialogs.DialogWaiting(context);
                await Provider.of<Api>(context,listen: false).addCart(info);
                Navigator.pop(context);
                }
                
              },
                          child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color:  Color(0XFFABC4A5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
