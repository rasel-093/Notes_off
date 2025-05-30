import 'package:flutter/material.dart';
import 'package:notes_off/HomeScreen.dart';

import 'database/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteDatabase.initialiseDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesOff',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homescreen(),
    );
  }
}