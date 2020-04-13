import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Api.dart';
import 'package:fruit_store/views/home.dart';
import 'package:provider/provider.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return 
    Provider.of<Api>(context,).category.isEmpty?
    
      
    Scaffold(body: Center(child: Text('Waiting',style: TextStyle(fontSize: 30),)),):
    FruitAppHomePage();
    //  Container(
    //    child: CircularProgressIndicator(),
    // );
    

  }
}