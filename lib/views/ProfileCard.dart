import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class ProfileCard extends StatelessWidget {
  String cardName;
  String image;
  Color color;
  String badge;
  IconData icon;
  bool badgeShow;
  Function ontab;
  ProfileCard({this.ontab,this.cardName,this.image,this.color,this.icon,this.badge='0',this.badgeShow=false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: ontab,
          child: Container(

            height: 200.0,
            width: 250.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [BoxShadow(color: Colors.grey)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
      Badge(badgeColor: Color(0XFF558948),badgeContent: Text(badge,style: TextStyle(color: Colors.white),),
      showBadge: badgeShow,child: Icon(icon,color: Color(0XFF558948),size: 70,)),
                SizedBox(
                  height: 10.0,
                ),
                
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Text(
                   cardName,
                    style: TextStyle(
                      fontFamily: Fonts.primaryFont,
                      color: Color(0XFF558948),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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