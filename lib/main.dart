import 'package:flutter/material.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:pet_shop_app/screens/startup.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MainApp(),
    ),
  );
}
//test new
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop App - Prelim Sucalit',
      debugShowCheckedModeBanner: false,
      home: StartPage()
    );

  }
}
