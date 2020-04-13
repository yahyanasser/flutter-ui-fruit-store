class InboxModel {
  int id;
  String contant ;
  String contant_ar ;
  String orderid ;

  InboxModel.fromJson(Map<String,dynamic> json){
    this.id=int.parse(json['id']);
    this.contant=json['contant'];
    this.contant_ar=json['contant_ar'];
    this.orderid=json['orderid'];

  }
}