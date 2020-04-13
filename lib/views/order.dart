import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/DataStorage.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:fruit_store/models/User.dart';

class Orders extends StatelessWidget {
  bool showappbar;
  Orders({this.showappbar = false});
  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    final body = Provider.of<Api>(context).order.length > 0
        ? Container(
            child: ListView(children: [
              // SizedBox(height: 20,),
              Column(
                  children: Provider.of<Api>(context)
                      .order
                      .map((f) =>f.statu==-9?SizedBox(): _buildCartCard(f, context))
                      .toList())
            ]),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(
                  LineIcons.list_alt,
                  color: Color(0XFF558948),
                  size: 150,
                ),
              ),
              Center(
                child: Text(
                 Language.vocabulary['emptyorder'][lang.lang],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
    return Scaffold(
      appBar: !showappbar
          ? null
          : AppBar(
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
      body: body,
    );
  }

  Widget _buildCartCard(Order order, BuildContext context) {
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
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Image.network(
              //    ImageUrl+ fruit,
              //     fit: BoxFit.cover,
              //     height: 80.0,
              //   ),
              // ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    Language.vocabulary['orderNo'][lang.lang] + order.order.toString(),
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //                         child: IconButton(icon: Icon(LineIcons.trash), onPressed: () async {
                                //                 //           Dialogs.DialogWaiting(context);
                                //                 //  await         Provider.of<Api>(context,listen: false).deleteCart({'id':fruit.cartid.toString()});
                                //                 //           Navigator.pop(context);
                                //                         })
                                // ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    order.statu == 1
                                        ?  Language.vocabulary['status1'][lang.lang]
                                        : order.statu == 2
                                            ? 
                                            Language.vocabulary['status2'][lang.lang]: order.statu == 3
                                                ? Language.vocabulary['status3'][lang.lang]
                                                : Language.vocabulary['status4'][lang.lang],
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    order.shipping == 0
                                        ? Language.vocabulary['type1'][lang.lang]
                                        : Language.vocabulary['type2'][lang.lang],
                                    style: TextStyle(
                                      fontFamily: Fonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
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
                                  '${order.total + order.shipping} R.M',
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
                      order.statu == 1
                          ? RaisedButton.icon(
                              textColor: Colors.white,
                              elevation: 10,
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () async {
                                Dialogs.DialogWaiting(context);
                        await        Provider.of<Api>(context,listen: false).cancleOrder(order.order.toString());
                                Navigator.pop(context);
                              },
                              icon: Icon(LineIcons.close),
                              label: Text(Language.vocabulary['cancelor'][lang.lang]))
                          : SizedBox()
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
}
