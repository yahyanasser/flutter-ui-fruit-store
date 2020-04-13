import 'package:flutter/material.dart';
import 'package:fruit_store/Function/Language.dart';
import 'package:fruit_store/Function/NavBartIndex.dart';
import 'package:fruit_store/app.dart';
import 'package:fruit_store/models/Login.dart';
import 'package:provider/provider.dart';

import 'Function/Api.dart';

void main() => runApp(MultiProvider(
  
  providers: [
            ChangeNotifierProvider<Api>(create: (context) => Api()),
            ChangeNotifierProvider<Language>(create: (context) => Language()),
            ChangeNotifierProvider<NavBarIndex>(create: (context) => NavBarIndex()),

  ],
  child: App()));