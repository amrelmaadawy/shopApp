import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/shopApp/login/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cart(),
      child: MaterialApp(
        themeMode:ThemeMode.system ,
        theme:ThemeData(appBarTheme:AppBarTheme(color: Colors.green.shade800),
     primarySwatch:Colors.green
         ) ,
        debugShowCheckedModeBanner: false,
      home:loginScreen()
      ),
    );
  }
}
