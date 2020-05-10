import 'package:flutter/material.dart';
import 'package:flutterapp/model/controller.dart';
import 'package:flutterapp/model/login.dart';
import 'welcomeScreen.dart';


/*class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',

      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(title: 'Log In Page'),
    );
  }
}*/

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  @override
  //_MyHomePageState createState() => _MyHomePageState();
  _LoginPageState createState() => _LoginPageState();

  final String title;

}

class _LoginPageState extends State<LoginPage> {

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            } else if (response == LoginController.STATUS_DUPLICATE) {
              _showSnackBar("Here you go!");
              //navigateToSubPage(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
    final snackbar = SnackBar(
        content: Text(message), backgroundColor: Colors.red);
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
          child: Column(
              children: <Widget>[
          TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'LOGIN PAGE'
          ),
        ),
        /*TextFormField(
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
      ),*/
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
      )
      ],
    )))
    ,
    );
  }
}
/*Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }*/
//}

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

