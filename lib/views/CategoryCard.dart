import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/models/Category.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:provider/provider.dart';
class CategoryCard extends StatelessWidget {
  Category category;
  CategoryCard({this.category});
  @override
  Widget build(BuildContext context) {
    var lang=    Provider.of<Language>(context);
bool ar=lang.lang=='ar';
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70
          ,
          width: 70,
          
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFF558948)),
            borderRadius: BorderRadius.circular(15)),
            child: Image.network(ImageUrlCate+category.image,width: 20,height: 20,),
        ),
        Text(ar? category.catNameAR:category.catName,style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}