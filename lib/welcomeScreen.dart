import 'package:flutter/material.dart';

import 'LoginPage.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Screen'),
      ),
      body: Center(child: RaisedButton(onPressed: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }, child: Text('Logout'),
      ),
      ),
    );
  }
}