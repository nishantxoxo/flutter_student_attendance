import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skooliya/providers/students.dart';
import 'package:skooliya/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> Students() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'attendance app',
        theme: ThemeData(        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen(),
      ),
    );
  }
}
