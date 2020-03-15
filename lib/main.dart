import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/wrapper.dart';
import 'package:myflutterapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:myflutterapp/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),  
      ),
    );
  }
}

