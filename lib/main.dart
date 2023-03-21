import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'createNewOrder.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abdullah Poultry Feed Mill',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewOrderList(),
    );
  }
}
