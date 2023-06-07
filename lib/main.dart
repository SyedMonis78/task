import 'package:flutter/material.dart';
import 'package:task/screens/bottom_navbar.dart';

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
