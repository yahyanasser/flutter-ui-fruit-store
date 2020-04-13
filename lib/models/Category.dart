class Category  {
  int id;
  String catName;
  String catNameAR;
  String image;
  
  Category.fromJson(Map<String,dynamic> json)
  {
    // json['product'];
  this.id=int.parse(json['id']) ;
  this.catName=json['name'];
  this.catNameAR=json['name_ar'];
  this.image=json['img'];

  }
}