import 'package:flutter/cupertino.dart';
import 'package:fruit_store/Function/DataStorage.dart';

class Language extends ChangeNotifier {
  var lang='ar';
  var dir=TextDirection.rtl;

  Language(){
    getlang();

      }
    
      Future<void> getlang() async {
        var l=await DataStorage.getString(DataStorage.lang,);
        if (l=='') {
dir=TextDirection.rtl;
     lang='ar';     
        }
        else if(l=='en'){
          dir=TextDirection.ltr;
     lang='en';
        }
        else if(l=='ar'){
          dir=TextDirection.rtl;
     lang='ar';
        }
    await DataStorage.getString(DataStorage.lang,);
   notifyListeners(); 

      }
  setlang(lang){
    DataStorage.setString(DataStorage.lang,lang);
   lang='en';
   notifyListeners(); 
    
  }
static var vocabulary={
  'home':
  {
    'en':'Home',
    'ar':'الرئيسيه',
    
  },
  'order':
  {
    'en':'Order',
    'ar':'طلباتي',
    
  },
  'inbox':
  {
    'en':'Inbox',
    'ar':'صندوق الوارد',
    
  },
  'my':
  {
    'en':'My',
    'ar':'حسابي',
    
  },
  'cat':
  {
    'en':"Category",
    'ar':'الاصناف',
    
  },
  'orderNo':
  {
    'en':"Order Number : ",
    'ar':'رقم الطلب : ',
    
  },
  'status1':
  {
    'en':'Status : Pending...',
    'ar':'حالة الطلب : قيد المراجعة',
    
  },
  'status2':
  {
    'en':'Status : Order is in progress',
    'ar':'حالة الطلب : جاري التوصيل',
    
  },
  'status4':
  {
    'en':'Status : Rejected',
    'ar':'حالة الطلب : مرفوض',
    
  },
   'status3':
  {
    'en':'Status : Delivered',
    'ar':'حالة الطلب : تم التوصيل',
    
  },
    'type1':
  {
    'en':'Type : Normal ',
    'ar':'نوع الطلب : عادي',
    
  },
  'type2':
  {
    'en':'Type : Quick ',
    'ar':'نوع الطلب : مستعجل',
    
  },
  'total':
  {
    'en':'A total of: ',
    'ar':'الاجمالي : ',
    
  },
   'cancelor':
  {
    'en':'Cancel',
    'ar':'الغاء الطلب',
    
  },
    'cancelall':
  {
    'en':'Cancel All',
    'ar':'حذف الكل',
    
  },
    'cancleall':
  {
    'en':'Cancel All',
    'ar':'حذف الكل',
    
  },
    'emptyinbox':
  {
    'en':'Nothing in your inbox. \nWe will notify you of any new updates',
    'ar':"لا يوجد شيء في بريدك الوارد. \n سنخطرك بأي تحديثات جديدة ",
    
  },
    'emptyorder':
  {
    'en': 'No Orders in the Order list. ',
    'ar':' .لا توجد طلبات في قائمة الطلبات',
    
  },
   'cart':
  {
    'en': 'Cart',
    'ar':'السلة',
    
  },
  'logout':
  {
    'en': 'Logout',
    'ar':'تسجيل الخروج',
    
  },
   'editprofile':
  {
    'en': 'Edit Profile',
    'ar':'تعديل الحساب',
    
  },
   'gram':
  {
    'en': 'Gram ',
    'ar':'جرام ',
    
  },
   'forone':
  {
    'en': ' For one',
    'ar':' للواحدة',
    
  },
  'forgram':
  {
    'en': ' For Gram',
    'ar':' للجرام',
    
  },
  'addorder':
  {
    'en': 'ٌAdd Requset',
    'ar':'طلب',
    
  },
   'add':
  {
    'en': 'ٌAdd',
    'ar':'اضافة',
    
  },
   'login':
  {
    'en': 'ٌLogin',
    'ar':'تسجيل الدخول',
    
  },
    'email':
  {
    'en': 'ٌEmail',
    'ar':'البريد الالكتروني',
    
  },
    'pass':
  {
    'en': 'ٌPassword',
    'ar':'كلمة المرور',
    
  },
  'pass':
  {
    'en': 'ٌPassword',
    'ar':'كلمة المرور',
    
  },
  'signin':
  {
    'en': 'ٌSign In',
    'ar':'أنشاء حساب',
    
  },
  'haveacc':
  {
    'en': 'Have Account ?',
    'ar':'هل تمتلك حساب ؟',
    
  },
  'username':
  {
    'en': 'Username',
    'ar':'اسم المستخدم',
    
  },
  'address':
  {
    'en': 'Address',
    'ar':'العنوان',
    
  },
   'phone':
  {
    'en': 'Phone',
    'ar':'رقم الهاتف',
    
  },
   'pass1':
  {
    'en': 'Confirm Password',
    'ar':'تاكيد كلمة المرور',
    
  },
  
};

  change(String lang) {
    lang=='en'?dir=TextDirection.ltr:dir=TextDirection.rtl;
    this.lang=lang;
    DataStorage.setString(DataStorage.lang, lang);
    notifyListeners();
  }

}