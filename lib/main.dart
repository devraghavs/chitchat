import 'package:chatapp/screens/auth.dart';
import 'package:chatapp/screens/chat.dart';
import 'package:chatapp/widgets/auth_form.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chit Chat',
      theme: ThemeData(

        primarySwatch: Colors.red,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor:Colors.red,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

        ),

      ),
      home: Scaffold(
        body: Container(child: AuthScreen(),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.blue],
        begin:Alignment.topLeft,
        end:Alignment.bottomRight,)),)
      ),
    );
  }
}
