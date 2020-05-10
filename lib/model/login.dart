class Login{

  String email;
  String password;
  String name;

  Login(this.name, this.email, this.password );

  String toParams() => "?name=$name&email=$email&password=$password";


}