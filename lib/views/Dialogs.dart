import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:provider/provider.dart';

class Dialogs {
  static LanguageDialog(context){
    showDialog(context: context,child: SimpleDialog(children: <Widget>[
      ListTile(title: Center(child: Text('العربية')),onTap:(){
        
        Provider.of<Language>(context,listen: false).change('ar');
        Navigator.pop(context);
      },),
      ListTile(title: Center(child: Text('English')),onTap:(){
         Provider.of<Language>(context,listen: false).change('en');
         Navigator.pop(context);
      }),
      // Text('English'),

    ],));
  }
  static const waiting = SpinKitCubeGrid(
    color: Color(0XFF558948),
    size: 100.0,
  );
  static DialogWaiting(context) {
    showDialog(context: context, child: waiting, barrierDismissible: true);
  }

  static StopDialog(context) {
    Navigator.of(context);
  }

  static ErrorDialog(context, errorTitle, error) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.ERROR,
      // body: Center(child: Text(
      //         error,
      //         style: TextStyle(fontStyle: FontStyle.italic),
      //       ),),
      tittle: errorTitle,
      desc: error,
      btnOkOnPress: () {},
    ).show();
  }

  static CustomDialog(context) {
    AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            body: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      
                      'When you choose the normal type, you will receive the request within 24 hours',
                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green),
                      textAlign: TextAlign.center,
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        ' When you choose an quick type, the order will reach you within 2-3 hours, and an additional value will be added to the total price',
                        style: TextStyle(color: Color(0XFFD2691F),fontWeight: FontWeight.bold)
                        ,
                      textAlign: TextAlign.center,
                        ),
                        
                  ),
                ],
              ),
            ),
            tittle: 'Choose the type of request',
            // desc: error,
           btnCancelOnPress : () async {
              // Navigator.pop(context);
              Dialogs.DialogWaiting(context);
              await Provider.of<Api>(context, listen: false).addOrders({
                'shipping': '60',
                'id': Provider.of<Api>(context, listen: false)
                    .cart
                    .first
                    .orderid
                    .toString(),
                'latitude': latitude,
                "longitude": longitude,
                'total': Provider.of<Api>(context, listen: false)
                    .cart
                    .fold(
                        0,
                        (prev, currnent) =>
                            prev +
                            (currnent.product.price * currnent.qty) +
                            (currnent.product.priceG * currnent.qtyG))
                    .toString()
              });
              Navigator.pop(context);
              if (Provider.of<Api>(context, listen: false).addOrder) {
                Navigator.pushNamedAndRemoveUntil(
                    context, homeViewRoute, (Route<dynamic> route) => false);
                // Dialogs.SuccssDialog(context: context,title: 'Your order has been sent successfully',message: 'You will be notified when your request is approved. You can see the status of your request in the order list');
              } else {
                Dialogs.ErrorDialog(
                  context,
                  'Error',
                  'An unexpected thing happened. Please resend your request',
                );
              }
            },
         btnCancelText   : 'quick',
            btnOkOnPress: () async {
              // Navigator.pop(context);
              Dialogs.DialogWaiting(context);
              await Provider.of<Api>(context, listen: false).addOrders({
                'shipping': '0',
                'id': Provider.of<Api>(context, listen: false)
                    .cart
                    .first
                    .orderid
                    .toString(),
                'latitude': latitude,
                "longitude": longitude,
                'total': Provider.of<Api>(context, listen: false)
                    .cart
                    .fold(
                        0,
                        (prev, currnent) =>
                            prev +
                            (currnent.product.price * currnent.qty) +
                            (currnent.product.priceG * currnent.qtyG))
                    .toString()
              });
              Navigator.pop(context);
              if (Provider.of<Api>(context, listen: false).addOrder) {
                Navigator.pushNamedAndRemoveUntil(
                    context, homeViewRoute, (Route<dynamic> route) => false);
                // Dialogs.SuccssDialog(context: context,title: 'Your order has been sent successfully',message: 'You will be notified when your request is approved. You can see the status of your request in the order list');
              } else {
                Dialogs.ErrorDialog(
                  context,
                  'Error',
                  'An unexpected thing happened. Please resend your request',
                );
              }
            },
            btnOkText: 'normal')
        .show();
  }

  static InfoDialog(context, errorTitle, error) {
    AwesomeDialog(
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.WARNING,
      // body: Center(child: Text(
      //         error,
      //         style: TextStyle(fontStyle: FontStyle.italic),
      //       ),),
      tittle: errorTitle,
      desc: error,
      btnOkOnPress: () {},
    ).show();
  }

  static SuccssDialog({context, title, message, onclick}) {
    AwesomeDialog(
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.SUCCES,
      tittle: title,
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }
}
