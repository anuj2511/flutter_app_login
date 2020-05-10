import 'package:flutter/material.dart';
import 'package:flutterapp/LoginPage.dart';
import 'package:flutterapp/model/controller.dart';
import 'package:flutterapp/model/login.dart';
import 'welcomeScreen.dart';
import 'package:email_validator/email_validator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',

      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Sign Up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();

  final String title;

}

class _MyHomePageState extends State<MyHomePage> {

  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  //TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submitForm() {
    if (_formkey.currentState.validate()) {
      Login login = Login(
          nameController.text,
          emailController.text,
          passwordController.text
      );
      LoginController loginController = LoginController(
              (String response) {
            print(response);
            if (response == LoginController.STATUS_SUCCESS) {
              _showSnackBar("Login Created");
              //navigateToSubPage(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }else if (response == LoginController.STATUS_DUPLICATE) {
              _showSnackBar("Login Already present! Please Login");
              //navigateToSubPage(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            } else {
              _showSnackBar("Error");
            }
          }
      );
      _showSnackBar("Submitting login");
      loginController.submitDetails(login);
    }
  }

  _showSnackBar(String message) {
    final snackbar = SnackBar(content: Text(message),);
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
        appBar: AppBar(
        title: Text(widget.title),
        ),
      body: Form(
          key: _formkey,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Valid name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Name"
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Valid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Valid password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitForm();
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Text("Submit"),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '        Already Logged in? Click below to log in'
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Log In"),
                  )
                ],
              )
          )
      ),
    );
  }

/*Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }*/
}

/*class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to back to Main Page'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Back to Main Page'),
              onPressed: () {
                backToMainPage(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void backToMainPage(context) {
    Navigator.pop(context);
  }
}*/

