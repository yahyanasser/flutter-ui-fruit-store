import 'package:flutter/material.dart';
import '_routing/router.dart' as router;
import '_routing/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0XFF558948)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: sechomeViewRoute,
    );
  }
}