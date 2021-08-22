import 'package:flutter/material.dart';
import 'package:learncard/ui/views/dashboard_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: DashboardView(),
      // home: FutureExample(title: 'Card Tutorial'),
    );
  }
}
