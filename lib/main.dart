import 'package:counter_mwwm/ui/screen/counter/counter_screen_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo MWWM',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: (_) => CounterScreenRoute(),
    );
  }
}
