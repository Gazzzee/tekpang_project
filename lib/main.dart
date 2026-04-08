import 'package:flutter/material.dart';
import 'services/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomeScreen(),
  ))
}