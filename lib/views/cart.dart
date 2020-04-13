import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/app.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/models/User.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:provider/provider.dart';

import 'Dialogs.dart';

class FruitAppCartView extends StatefulWidget {
  Map<String, dynamic> cart;
  // List<Product> product;

  @override
  _FruitAppCartViewState createState() => _FruitAppCartViewState();
}

class _FruitAppCartViewState extends State<FruitAppCartView> {
  @override
  void initState() {
    super.initState();

// reorder();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    final appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(LineIcons.long_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(LineIcons.th_large),
          onPressed: () {},
        ),
      ],
    );

    final cartValue = Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
           Language.vocabulary['total'][lang.lang],
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.primaryFont,
            ),
          ),
          Text(
            '${Provider.of<Api>(context).cart.fold(0, (prev, currnent) => prev + (currnent.product.price * currnent.qty) + (currnent.product.priceG * currnent.qtyG))} R.M',
            // '\$10523',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.primaryFont,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () async {
                //     Dialogs.DialogWaiting(context);
                //  await   Provider.of<Api>(context,listen: false).addOrders({'id':user.id.toString()});
                //     Navigator.pop(context);
                //     if (Provider.of<Api>(context,listen: false).addOrder) {
                //       Dialogs.SuccssDialog(context: context,title: 'Your order has been sent successfully',message: 'You will be notified when your request is approved. You can see the status of your request in the order list');
                //     }
                //     else{
                //       Dialogs.ErrorDialog(context, 'Error', 'An unexpected thing happened. Please resend your request',);
                //     }
                Navigator.pushNamed(
                  context,
                  '$map',
                );
              },
              child: Text(
                Language.vocabulary['addorder'][lang.lang],
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0XFF558948),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              Dialogs.DialogWaiting(context);
              await Provider.of<Api>(context, listen: false).removeAll({
                'id': Provider.of<Api>(context, listen: false)
                    .cart
                    .first
                    .orderid
                    .toString()
              });
              Navigator.pop(context);
            },
            child: Icon(
              LineIcons.trash,
              color: Colors.white,
            ),
            color: Colors.red,
          )
        ],
      ),
    );

    final btn = Column(
      children: <Widget>[
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(45.0),
          shadowColor: Colors.white,
          child: Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width / 4 * 3,
            decoration: BoxDecoration(
              color: Color(0XFF558948),
              borderRadius: BorderRadius.circular(45.0),
            ),
            child: Center(
              child: Text(
                'Settlement',
                style: TextStyle(
                  fontFamily: Fonts.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );

    final body = Provider.of<Api>(context).cart.length > 0
        ? Column(children: [
            Expanded(
              child: Container(
                child: ListView(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: Provider.of<Api>(context)
                          .cart
                          .map((f) => _buildCartCard(f, context))
                          .toList())
                ]),
              ),
            ),
            cartValue
          ])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(
                  LineIcons.cart_plus,
                  color: Color(0XFF558948),
                  size: 150,
                ),
              ),
              Center(
                child: Text(
                  'No products in the cart. \nAdd your favorite products to your cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
 
    return Directionality(
          child: Scaffold(
        // bottomSheet: ,

        appBar: AppBar(
          actions: <Widget>[
            Badge(
              child: IconButton(
                icon: Badge(
                    badgeContent:
                        Text('${Provider.of<Api>(context).order.length}'),
                    showBadge: Provider.of<Api>(context).order.length > 0,
                    child: Icon(LineIcons.list_alt)),
                onPressed: () {
                  Navigator.pushNamed(context, '$order', arguments: true);
                },
                color: Colors.black,
              ),
            ),
          ],
          leading: IconButton(
            color: Colors.black,
            icon: Icon(LineIcons.long_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: body,
      ), textDirection: TextDirection.rtl,
    );
  }

  Widget _buildCartCard(CartModels fruit, BuildContext context) {
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  ImageUrl + fruit.product.image,
                  fit: BoxFit.cover,
                  height: 80.0,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                           ar?   fruit.product.nameAR:fruit.product.name,
                              style: TextStyle(
                                fontFamily: Fonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                              child: IconButton(
                                  icon: Icon(LineIcons.trash),
                                  onPressed: () async {
                                    Dialogs.DialogWaiting(context);
                                    await Provider.of<Api>(context,
                                            listen: false)
                                        .deleteCart(
                                            {'id': fruit.cartid.toString()});
                                    Navigator.pop(context);
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      fruit.product.price != 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: '\$${fruit.product.price}',
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  TextSpan(
                                    text: Language.vocabulary['forone'][lang.lang],
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.orange,
                                    ),
                                  )
                                ])),
                                counter(fruit)
                              ],
                            )
                          : SizedBox(),
                      fruit.product.priceG != 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: '\$${fruit.product.price}',
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  TextSpan(
                                    text:Language.vocabulary['forgram'][lang.lang],
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.orange,
                                    ),
                                  )
                                ])),
                                countergram(fruit)
                              ],
                            )
                          : SizedBox(),
                      Row(
                        children: <Widget>[
                          Text(
                           Language.vocabulary['total'][lang.lang],
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.primaryFont,
                            ),
                          ),
                          Text(
                            '${(fruit.qty * fruit.product.price) + (fruit.qtyG * fruit.product.priceG)} R.M',
                            // '\$10523',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.primaryFont,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row countergram(CartModels fruit) {
      var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    return Row(
      children: <Widget>[
        Text(Language.vocabulary['gram'][lang.lang]),
        InkWell(
          onTap: fruit.qtyG > 250
              ? () {
                  fruit.qtyG = fruit.qtyG - 250;
                  Provider.of<Api>(context, listen: false).increase({
                    "id": fruit.cartid.toString(),
                    "count": fruit.qty.toString(),
                    "countG": fruit.qtyG.toString(),
                  });
                  print('object');
                }
              : null,
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.red,
                size: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          fruit.qtyG.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.0,
        ),
        InkWell(
          onTap: () {
                     fruit.qtyG = fruit.qtyG + 250;
                  Provider.of<Api>(context, listen: false).increase({
                    "id": fruit.cartid.toString(),
                    "count": fruit.qty.toString(),
                    "countG": fruit.qtyG.toString(),
                  });
                  print('object');
          },
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.green,
                size: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row counter(CartModels fruit) {
    return Row(
      children: <Widget>[
        Text('      '),
        InkWell(
          onTap: fruit.qty > 1
              ? () {
                  fruit.qty = fruit.qty - 1;
                  Provider.of<Api>(context, listen: false).increase({
                    "id": fruit.cartid.toString(),
                     "count": fruit.qty.toString(),
                    "countG": fruit.qtyG.toString(),
                  });
                  print('object');
                }
              : null,
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.red,
                size: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          fruit.qty.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.0,
        ),
        InkWell(
          onTap: () {
            fruit.qty = fruit.qty + 1;
            Provider.of<Api>(context, listen: false).increase(
                {"id": fruit.cartid.toString(), 
              "count": fruit.qty.toString(),
                    "countG": fruit.qtyG.toString(),
                });
            print('object');
          },
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.green,
                size: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void reorder() {
    Provider.of<Api>(context, listen: false).product.map((f) => print(f.id));
  }
}
