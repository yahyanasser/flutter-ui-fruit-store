import 'package:flutter/material.dart';
import 'package:fruit_store/_routing/routes.dart';
import 'package:fruit_store/views/Maps.dart';
import 'package:fruit_store/views/Profile.dart';
import 'package:fruit_store/views/SignUp.dart';
import 'package:fruit_store/views/cart.dart';
import 'package:fruit_store/views/details.dart';
import 'package:fruit_store/views/editProfile.dart';
import 'package:fruit_store/views/home.dart';
import 'package:fruit_store/views/products.dart';
import 'package:fruit_store/views/secHome.dart';
import 'package:fruit_store/views/reviewOrder.dart';
import 'package:fruit_store/views/order.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppHomePage());
      break;
        case editProfile:
      return MaterialPageRoute(builder: (context) => EditProfile());
      break;
       case products:
      return MaterialPageRoute(builder: (context) => Produects(settings.arguments));
      break;
      case order:
      return MaterialPageRoute(builder: (context) => Orders(showappbar: settings.arguments,));
      break;
      case sechomeViewRoute:      
      return MaterialPageRoute(builder: (context) => Start());
      break;
       case reViewOrder:      
      return MaterialPageRoute(builder: (context) => ReViewOrder());
      break;
      case map:      
      return MaterialPageRoute(builder: (context) => MapSample());
      break;
    case detailsViewRoute:
      return MaterialPageRoute(
        builder: (context) => FruitAppFruitDetails(fruit: settings.arguments),
      );
      break;
    case cartViewRoute:
      return MaterialPageRoute(builder: (context) => FruitAppCartView());
      break;
      case signuppage:
      return MaterialPageRoute(builder: (context) => SignUp());
      break;
       case profile:
      return MaterialPageRoute(builder: (context) => Profile());
      break;
    // default:
    //   return MaterialPageRoute(builder: (context) => Start());
  }
}
