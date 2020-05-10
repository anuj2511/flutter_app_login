import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginController{

  final void Function(String) callback;

  //stat

  static const String URL = "https://script.google.com/macros/s/AKfycbwf6NQ3bc9ziwRMNg_gWwO3WR_Oe-EXZ6SqX-_EsT3nxtvI47vC/exec";

  static const STATUS_SUCCESS = "SUCCESS";
  static const STATUS_DUPLICATE = "DUPLICATE";

  LoginController(this.callback);

  void submitDetails(Login login) async{
    try{
      await http.get(
        URL + login.toParams()
      ).then((response){
        callback(convert.jsonDecode(response.body)['status']);
      });
    }catch(e){
      print(e);
    }
  }
}