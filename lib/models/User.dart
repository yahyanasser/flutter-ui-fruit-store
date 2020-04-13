import 'package:fruit_store/Function/AddtoCart.dart';
import 'package:fruit_store/models/Product.dart';

class User {
  int id=-1;
  String name='';
  String phone='';
  String address='';
  String pass='';
 User();
      
      User.fromJson(Map<String,dynamic> json){
        this.id=int.parse( json['id']);
        this.name=json['full_name'];
        this.address=json['address'];
        this.phone=json['mobile'];
        this.pass=json['password'];
        
      }
    }
  
  class CartModels {
    int orderid;
    int cartid;
    int productid;
    int pass;
    Product product;
    double   qty;
    double   qtyG;
    // int type;
    double   total;
    String date;
    
      CartModels.fromJson(Map<String,dynamic> json){
this.productid=int.parse( json['pro_id']);
this.orderid=int.parse( json['id']);
this.cartid=int.parse( json['cartid']);
this.qty=double.parse( json['qty']);
this.qtyG=double.parse( json['qtyG']);
// this.type=int.parse( json['type']);
this.date= json['type'];
this.product= json['product'];
      }
    
}
  
  class Order {
     int order;
    int statu;
    double   total;
    double shipping;
    String date;
    Order.fromJson(Map<String,dynamic> json){
      this.order=int.parse( json['id']);
      this.statu=int.parse(json['status']);
      this.date=json['date'];
      this. total=double.parse(json['totall']); 
      this. shipping=double.parse(json['shipping']); 
      // this.shipping=json['shipping'];

    }
    
}