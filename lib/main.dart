import 'package:flutter/material.dart';
import 'package:training_2/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ツッコミマシーン",
      theme: ThemeData.dark(),
      home:HomeScreen(),
    );
  }
}
