class Exceptions{
  static dynamic handleException(e) {
    switch(e.message){
      case "Email veya şifre yanlış":
        return 'Yanlış Email Veya Şifre';
      default:
        return 'a';
    }
  }
}