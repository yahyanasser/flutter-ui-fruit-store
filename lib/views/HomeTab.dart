import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/utils/utils.dart';
import 'package:fruit_store/views/CategoryCard.dart';
import 'package:fruit_store/widgets/fruits.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {

    TabController tabController;
    int categoryID=0;

  
      void _handlerListner() {
setState(() {
  
categoryID=       tabController.index ;
print(tabController.index)        ;
});
  }
  @override
  Widget build(BuildContext context) {
var lang=    Provider.of<Language>(context);
bool ar=lang.lang=='ar';
var cat=    Provider.of<Api>(context).category;
    Widget header=  Padding(
            padding: 
           !ar? EdgeInsets.only(left: 15.0):
            EdgeInsets.only(right: 15.0),
            child: Text(
    Language.vocabulary['cat'][lang.lang],
    style: TextStyle(
        fontFamily: Fonts.primaryFont,
        fontSize: 25.0,
        fontWeight: FontWeight.bold),
  ),
          );
    Widget body=GridView.count(
          crossAxisCount: 4,
                shrinkWrap: true,

          children: List.generate(cat.length, (index) {
              return Center(
                child: InkWell(onTap: ()=>Navigator.pushNamed(context, '$products',arguments: cat[index].id),child: CategoryCard(category:cat[index] ,)),
              );}
          ));
    
    return    ListView(shrinkWrap: true,children:[header, body]);
    //     children: <Widget>[
    //       // SizedBox(
    //       //   height: 10.0,
    //       // ),
    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //   children: <Widget>[
             
    //       //     // // Container(
    //       //     // //   height: 50.0,
    //       //     // //   width: MediaQuery.of(context).size.width * 0.75,
    //       //     // //   decoration: BoxDecoration(
    //       //     // //     color: Colors.grey.withOpacity(0.1),
    //       //     // //     borderRadius: BorderRadius.only(
    //       //     // //       bottomRight: Radius.circular(25.0),
    //       //     // //       bottomLeft: Radius.circular(25.0),
    //       //     // //       topRight: Radius.circular(25.0),
    //       //     // //       topLeft: Radius.circular(25.0),
    //       //     // //     ),
    //       //     // //   ),
    //       //     //   child: TextField(
    //       //     //     decoration: InputDecoration(
    //       //     //       border: InputBorder.none,
    //       //     //       contentPadding: EdgeInsets.only(top: 15.0),
    //       //     //       prefixIcon: Icon(
    //       //     //         CupertinoIcons.search,
    //       //     //         color: Colors.grey,
    //       //     //       ),
    //       //     //     ),
    //       //     //   ),
    //       //     // ),
              
    //       //   ],
    //       // ),
    //       SizedBox(
    //         height: 10.0,
    //       ),
        
    //       Padding(
    //         padding: EdgeInsets.only(top: 10.0),
    //         child: TabBar(


    //       //     onTap: (index){
    
    //       //  categoryID=           Provider.of<Api>(context,listen: false).category[index].id;
    //       //     },
              
    //             controller: tabController,
    //             onTap: (index){
    //               setState(() {
                    
    //               });

    //             },

    //             indicatorColor: Colors.transparent,
    //             labelColor: Colors.black,
    //             unselectedLabelColor: Colors.grey.withOpacity(0.6),
    //             isScrollable: true,
                
    //             tabs:
    //             Provider.of<Api>(context,).category.isEmpty?[]:
    //             Provider.of<Api>(context,).category.map((cat)=>
                  
    //               Tab(
    //                 child: TabText.tabbedText(cat.catName),
    //               )
    //             ,) .toList()
    //             // <Widget>[
                  
    //               // Tab(
    //               //   child: TabText.tabText2,
    //               // ),
    //               // Tab(
    //               //   child: TabText.tabText3,
    //               // ),
    //               // Tab(
    //               //   child: TabText.tabText4,
    //               // ),
    //             // ],
    //           ),
    //       ),
    //       Container(
    //         height: 330.0,
    //         child: TabBarView(


    //           controller: tabController,
    //           // children: <Widget>[
    //           //                     new FruitsWidget(),
    //           //                     new FruitsWidget(),
    
    //           // ],
    //          children:Provider.of<Api>(context,).category.isEmpty?[]:   Provider.of<Api>(context,).category.map((cat)=>
    //                               new FruitsWidget(Provider.of<Api>(context,listen: false).category[categoryID].id),
    //          ) .toList()
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10.0,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //           left: 15.0,
    //         ),
    //         child: Texts.subHeader,
    //       ),
    //       SizedBox(
    //         height: 10.0,
    //       ),
    //       Container(
    //         height: 150.0,
    //         child: ListView(
    //           scrollDirection: Axis.horizontal,
    //           children:Provider.of<Api>(context,).sale 
              
    //           .reversed
    //               .map((fruit) =>Sales(sale: fruit,))
    //               .toList(),
    //         ),
    //       )
    //     ],
    //         );
  }
  }
  
    
  