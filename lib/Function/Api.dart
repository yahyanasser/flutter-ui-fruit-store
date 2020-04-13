import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fruit_store/Function/DataStorage.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/models/Category.dart';
import 'package:fruit_store/models/Product.dart';
import 'package:fruit_store/models/User.dart';
import 'package:fruit_store/models/inbox.dart';
import 'package:http/http.dart'as http;
//  const String Uri='http://192.168.137.1/FuritShop/';
 const String Uri='http://fruitshop.mangoholiday.co/fruit/';
 const String ImageUrl='http://mangoholiday.co/cpfruit/php/images/';
 const String ImageUrlCate='http://mangoholiday.co/cpfruit/php/images_catgory/';
class Api extends ChangeNotifier {
 bool statu=true;
 int requestnum=0;
 List<dynamic> categoryAndProduect=List();
 List<dynamic> cartAndOrder=List();
 List<Category> category=List();
 List<Product> product=List();
 List<Product> sale=List();
 List<CartModels> cart=List();
 List<Order> order=List();
  bool isWaiting=true;
 bool isuserExist=false;
 bool wrongpass=false;
bool addOrder;
  var userid;

  List<dynamic> orderid=List();

  List<InboxModel> inbox=List();
Api(){
  getDataProduct();
  // getuser();
  // notifyListeners();
}
reorder(){
  cart.map((f)=>print(f.cartid));
}
  int categoryLeangth;
getuser() async {
 if(await DataStorage.getid()!=-1){
   isWaiting=true;

var response= await http.post(Uri+'getuser.php',body: {'id':user.id.toString()}).catchError((onError){
  statu=false;
  isWaiting=false;
  
  // notifyListeners();
}).timeout(Duration(seconds: 30));
user=User.fromJson(json.decode(response.body)[0]);
print(user);

getcartAndOrders(user.id);
  getinbox();

// user.id=
   notifyListeners();

 }
 else{
   notifyListeners();
 }
  // notifyListeners();

}
getcartAndOrders(id) async {
  cart.clear();
  order.clear();
  orderid.clear();
  var response= await http.post(Uri+'getCart.php',body: {'id':id.toString()}).catchError((onError){
  statu=false;
  isWaiting=false;
  
  // notifyListeners();
}).timeout(Duration(seconds: 30));
cartAndOrder=json.decode( response.body);

  cartAndOrder.forEach((cartandorder){
    if (cartandorder['status']=='0') {
  Map<String,dynamic> productmap=Map();
 product.map((f){
if(f.id.toString()==cartandorder['pro_id'])
productmap={
    'product':f
  }    ;

 }).toList();  
 productmap.addAll(cartandorder);   
    this.cart.add( CartModels.fromJson(productmap));
    }else{
      if (!orderid.contains(cartandorder['id'])) {
        print('object');
    this.order.add( Order.fromJson(cartandorder));
      orderid.add(cartandorder['id']);
      }
      // requestnum++;

    }
    });
  notifyListeners();

print(user);
}

getDataProduct() async {
  isWaiting=true;

var response= await http.post(Uri+'Get_Cat_and_Produect.php',).catchError((onError){
  statu=false;
  isWaiting=false;
  
  // notifyListeners();
}).timeout(Duration(seconds: 30));

  if(response.statusCode==200){
  isWaiting=false;

  statu=true;
  categoryAndProduect=json.decode( response.body);
   categoryAndProduect[0].forEach((category)=>this.category.add(Category.fromJson(category)));

  categoryAndProduect[1].forEach((product)=>this.product.add( Product.fromJson(product)));
  categoryAndProduect[2].forEach((sale)=>this.product.add( Product.fromJson(sale)));
  categoryLeangth=category.length;
  getuser();
  // notifyListeners();

  
  // print(response.body);
  // CategoryAndProduect.fromJson(json.decode( response.body));


  // print(response.body);
  }
// categoryAndProduect= ;

  // print(response.body);

}
signup(signUpData)
async {
  isWaiting=true;
  var response= await http.post(Uri+'SignUp.php',body: signUpData).catchError((onError){

  statu=false;
  isWaiting=false;

  
  // notifyListeners();
}).timeout(Duration(seconds: 30));
if(response.statusCode==200){
  print(response.body);
  isuserExist=response.body!='Successfully';
  isWaiting=false;
}
  //  notifyListeners();
}
login(logindata)
async {
  print(logindata);
  isWaiting=true;
  var response= await http.post(Uri+'login.php',body: logindata).catchError((onError){

  statu=false;
  print(onError);
  // notifyListeners();
}).timeout(Duration(seconds: 30));
if(response.statusCode==200){
  statu=true;
  print(response.body);
  wrongpass=response.body=='exist'?
  null:

  isWaiting=false;
  user=User.fromJson(json.decode(response.body)[0] );
  getcartAndOrders(user.id);
  notifyListeners();
}
  //  notifyListeners();
}

addCart(info) async {
  var response= await http.post(Uri+'addcart.php',body: info);
  print(response);
 await getcartAndOrders(user.id);
  notifyListeners();

}
deleteCart(info) async {
  var response= await http.post(Uri+'deleteitem.php',body: info);

  print(response);
 await getcartAndOrders(user.id);
  notifyListeners();

}

  Future<void> increase(info)
   async {

     notifyListeners();
  var response= await http.post(Uri+'increase.php',body: info);

  }

  Future<void> removeAll(info) async {
  var response= await http.post(Uri+'deleteAll.php',body:info );
 await getcartAndOrders(user.id);
    notifyListeners();
  }

  addOrders(Map<String, String> info) async {
    var response= await http.post(Uri+'AddOrder.php',body:info );
    addOrder=response.statusCode==200;
 await getcartAndOrders(user.id);
 
    notifyListeners();
  }
  
  cancleOrder( id) async {
    var response= await http.post(Uri+'cancelOrder.php',body:{'id':id} );
    // addOrder=response.statusCode==200;
 await getcartAndOrders(user.id);
 
    notifyListeners();
  }
  getinbox() async {
    inbox.clear();
    var response= await http.post(Uri+'getinbox.php',body: {'id':user.id.toString()}).catchError((onError){
  statu=false;
  isWaiting=false;
  
  // notifyListeners();
}).timeout(Duration(seconds: 30));

json.decode(response.body).map((inbox)=>

this.inbox.add(InboxModel.fromJson(inbox)  )).toList();

print(user);

// getcartAndOrders(user.id);
// user.id=
   notifyListeners();

 }

  Future<void> removeinbox(String id) async {
     var response= await http.post(Uri+'deleteinbox.php',body:{'id':id} );
 await getinbox();
    // notifyListeners();
  }

  deleteAllInbox() async {
      //  inbox.clear();
       var response= await http.post(Uri+'deleteAllinbox.php',body:{'id':user.id.toString()} );
 await getinbox();
  }

  editdata(Map<String, String> editData) async {
      var response= await http.post(Uri+'editprofile.php',body:editData );
 await getuser();
  }
  }


  
