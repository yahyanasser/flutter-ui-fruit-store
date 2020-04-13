import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/User.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ReViewOrder extends StatefulWidget {
  @override
  _ReViewOrderState createState() => _ReViewOrderState();
}

class _ReViewOrderState extends State<ReViewOrder> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: <Widget>[
        Icon(
          LineIcons.cart_plus,
          color: Color(0XFF558948),
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
          child: TextFormField(
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
              hintText: user.name,
              // enabled: false,
              hintStyle: TextStyle(color: Colors.black),
              border: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Color(0XFF558948))),
            ),
            enabled: false,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
          child: TextFormField(
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
              hintText: user.phone,
              hintStyle: TextStyle(color: Colors.black),
              border: new UnderlineInputBorder(
                  borderSide: new BorderSide(color: Color(0XFF558948))),
            ),
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        ),
        Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'product',
                style: TextStyle(color: Color(0XFF558948),fontWeight: FontWeight.bold),
              ),Text(
                'Count',
                style: TextStyle(color: Color(0XFF558948),fontWeight: FontWeight.bold),
              ),Text(
                'price',
                style: TextStyle(color: Color(0XFF558948),fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Column(
          children: Provider.of<Api>(context)
              .cart
              .map((f) => Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: _buildlist(f),
                  ))
              .toList(),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center ,crossAxisAlignment: CrossAxisAlignment.center,children:[ Text(
            'A total of: ',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.primaryFont,
            ),
          ),
          Text(
            '${Provider.of<Api>(context).cart.fold(0, (prev,currnent)=>prev+  (currnent.product.price*currnent.qty)+(currnent.product.priceG*currnent.qtyG))} R.M',
            // '\$10523',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.primaryFont,
            ),
          ),])
        
      ],
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            LineIcons.long_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: <Widget>[Expanded(child: body),Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(onPressed: () async {
Dialogs.CustomDialog(context, );

          //          Dialogs.DialogWaiting(context);
          //  await   Provider.of<Api>(context,listen: false).addOrders({'id':Provider.of<Api>(context,listen: false).cart.first.orderid  .toString(),'latitude':latitude,"longitude":longitude,'total':Provider.of<Api>(context,listen: false).cart.fold(0, (prev,currnent)=>prev+  (currnent.product.price*currnent.qty)+(currnent.product.priceG*currnent.qtyG)).toString()});
          //     Navigator.pop(context);
          //     if (Provider.of<Api>(context,listen: false).addOrder) {
          //       Navigator.pushNamedAndRemoveUntil(context, homeViewRoute, (Route<dynamic> route) => false);
          //       // Dialogs.SuccssDialog(context: context,title: 'Your order has been sent successfully',message: 'You will be notified when your request is approved. You can see the status of your request in the order list');
          //     }
          //     else{
          //       Dialogs.ErrorDialog(context, 'Error', 'An unexpected thing happened. Please resend your request',);
          //     }
            }, icon:Icon(LineIcons.cart_plus), label: Text("Send Order"),textColor: Color(0XFF558948),),
          ],
        )],),
    );
  }

  Widget _buildlist(CartModels f) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(f.product.name),
        Text(f.product.price != 0 && f.product.priceG != 0
            ? f.qty.toString() + "," + f.qtyG.toString() + 'Gram'
            : f.product.price != 0
                ? f.qty.toString()
                : f.qtyG.toString() + 'Gram'),
        Text('${(f.qty * f.product.price) + (f.qtyG * f.product.priceG)} R.M')
      ],
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<Api>(context,listen: false).addOrder?                Dialogs.SuccssDialog(context: context,title: 'Your order has been sent successfully',message: 'You will be notified when your request is approved. You can see the status of your request in the order list'):
null;
  }
}
