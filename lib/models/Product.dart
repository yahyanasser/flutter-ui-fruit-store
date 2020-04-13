class Product {
  int id;
  int isSale;
  int catrgoryID;
  String name;
  String nameAR;
  String image;
  String description;
  String descriptionAR;
  String color;
  double priceG;
  double price;
  double sale;
  double rating;
  

 Product.fromJson(Map<String,dynamic>json){

  this.id=int.parse(json['id']);
  this.catrgoryID=int.parse(json['category_id']);
  this.name=json['product_name'];
  this.nameAR=json['product_name_ar'];
  this.image=json['img'];
  this.description=json['description'];
  this.priceG=double.parse(json['pricG']) ;
  this.descriptionAR=json['description_ar'];
  this.price=double.parse(json['price']) ;
  this.sale=double.parse(json['sale']) ;
  this.isSale=int.parse(json['IsSale']) ;
  this.color=json['color'] ;
  // this.rating=double.parse(json['sale']) ;
}
}