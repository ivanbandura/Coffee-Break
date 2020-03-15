import 'package:flutter/material.dart';
import 'package:myflutterapp/models/brew.dart';
import 'package:myflutterapp/screens/home/settings_form.dart';
import 'package:myflutterapp/services/auth.dart';
import 'package:myflutterapp/services/database.dart';
import 'package:provider/provider.dart';

import 'package:myflutterapp/screens/home/brew_list.dart';

class Home extends StatelessWidget {

 final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

     void _showSettingsPanel() {
       showModalBottomSheet(context: context, builder: (context){
         return Container( 
           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
         );
       });
     }

    return StreamProvider<List<Brew>>.value(
            value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Coffee Break'),
          backgroundColor: Colors.grey[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
               await _auth.signOut();
              },

            ),

          FlatButton.icon( 
            icon: Icon(Icons.settings),
            label: Text('settings'),
            onPressed: () => _showSettingsPanel(),

          ),


          ],
        ),
        body: Container(

          decoration: BoxDecoration(  
            image: DecorationImage(
             image: AssetImage('assets/coffee_bg.png'),
             fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
          ),
      ),
    );
  }
}
