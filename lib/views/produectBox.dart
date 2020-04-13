import 'package:flutter/material.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/models/fruit.dart';
import 'package:fruit_store/utils/utils.dart';
import '../Function/Api.dart';
class ProduectsBox extends StatelessWidget {
  Product produect;
  ProduectsBox({this.produect});
  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.only(right: 0.0, left: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: 100,
          ),
                    produect.isSale==0?SizedBox():

          Positioned(
            left: 15.0,
            child: Container(
              height: 20.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: Color(0XFFD2691F),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
          ),
          
          Positioned(
            top: 7.0,
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Colors.white,
              child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   '$detailsViewRoute',
                  //   arguments: fruit,
                  // );
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0XFFABC4A5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(
                   ImageUrl+produect.image,
                    fit: BoxFit.fill,
                    height: 70.0,
                  ),
                ),
              ),
            ),
          ),
          produect.isSale==0?SizedBox():
          Positioned(
            left: 15.0,
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Color(0XFFFE9741),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3.0),
                  bottomRight: Radius.circular(3.0),
                  topLeft: Radius.circular(3.0),
                ),
              ),
              child: Center(
                child: Text(
                  produect.sale.truncate(). toString() + '%',
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    fontSize: 9.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}