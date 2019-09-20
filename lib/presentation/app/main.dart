import 'package:flutter/material.dart';
import 'package:flutter_app_template/presentation/di/injection.dart';
import 'package:flutter_app_template/presentation/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Provider provider = Provider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page', provider: provider),
    );
  }
}
