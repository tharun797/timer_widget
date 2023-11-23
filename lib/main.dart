import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/model/database.dart';
import 'package:timer_app/screens/timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataBase(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TimerScreen(),
      ),
    );
  }
}
