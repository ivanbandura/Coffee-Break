
import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/authenticate/authenticate.dart';
import 'package:myflutterapp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:myflutterapp/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
 final user = Provider.of<User>(context);


  

   //return Home or Authenticate widget
   if(user == null) {
     return Authenticate();
   } else {
     return Home();
   }
  
  }
}