class AppRegex {
  AppRegex._();

  static bool isEmailValid (String email){
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }

  static bool isPassValid (String pass){
    RegExp regex = RegExp(r'.{6,}');
    return regex.hasMatch(pass);
  }

}