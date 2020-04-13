import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/Category.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/Dialogs.dart';
import 'package:fruit_store/views/produectBox.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class FruitsWidget extends StatefulWidget {
  int catid;
  FruitsWidget(this.catid);
  @override
  _FruitsWidgetState createState() => _FruitsWidgetState();
}

class _FruitsWidgetState extends State<FruitsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: Provider.of<Api>(context,listen: false).product.map((fruit){
        return
        widget.catid==fruit.catrgoryID?
          
        _buildFruitCard(fruit):SizedBox();
      } ).toList(),
    );
  }

  Widget _buildFruitCard(Product fruit) {
    // print();
    var lang=    Provider.of<Language>(context);
    bool ar=lang.lang=='ar';
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '$detailsViewRoute',
              arguments: fruit,
            );
          },
          child: Container(
            // height: 120.0,
            width: 250.0,
            decoration: BoxDecoration(
              // color:Color(0XFF558948),
              color: Colors.white10,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
             
               ProduectsBox(produect:fruit ,),
               Expanded(
                                child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                                                children:[ Text(
                           ar?fruit.nameAR:  fruit.name,
                             
                             style: TextStyle(
                               fontFamily: Fonts.primaryFont,
                               color: Colors.black,
                               fontSize: 16.0,
                               fontWeight: FontWeight.w900,
                             ),
                             textAlign: TextAlign.start,
                           ),
                                                ]),
                          Row(
                                                  children:[ Expanded(
                                                                                                      child: Text(
                            ar?   fruit.descriptionAR:   fruit.description,
                               style: TextStyle(
                                 fontFamily: Fonts.primaryFont,
                                 color: Colors.black54,
                                 fontSize: 10.0,
                                 
                                 fontWeight: FontWeight.w900,
                               ),
// maxLines: 3,
                              //  overflow: TextOverflow.ellipsis,
                               textAlign: TextAlign.start,
                             ),
                                                  ),
                                                  ]),
                         SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Column(
                               children: <Widget>[
fruit.price==0?
                    SizedBox():
                    RichText(text: TextSpan(children: [TextSpan(text: '${fruit.price} R.M', style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),TextSpan(text: Language.vocabulary['forone'][lang.lang], style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        color: Colors.black54,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),)])),
                      fruit.priceG==0?
                    SizedBox():
                    
                    RichText(text: TextSpan(children: [TextSpan(text: '${fruit.priceG} R.M', style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),),TextSpan(text: Language.vocabulary['forgram'][lang.lang], style: TextStyle(
                        fontFamily: Fonts.primaryFont,
                        color: Colors.black54,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),)])),

                               ],
                             ),
                             RaisedButton.icon(

                                         textColor: Colors.white,
                              elevation: 10,
                              color: Color(0XFFABC4A5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                               
                               icon: Icon(LineIcons.plus_circle),
                               label: Text(Language.vocabulary['add'][lang.lang]),
                                onPressed: () async {
              
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
                
              

                             })
                           ],
                         )
                   ],),
                 ),
               ),
                
                // Text(
                //   '\$${fruit.price}',
                //   style: TextStyle(
                //     fontFamily: Fonts.primaryFont,
                //     color: Colors.white,
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
            
                // SizedBox(
                //   height: 15.0,
                // ),
                // InkWell(
                //   onTap: () {},
                //   child: Container(
                //     height: 40.0,
                //     width: 145.0,
                //     decoration: BoxDecoration(
                //       color: Colors.white.withOpacity(0.3),
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Add to Cart',
                //         style: TextStyle(
                //           fontFamily: Fonts.primaryFont,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16.0,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
