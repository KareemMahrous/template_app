abstract class Routes {

  static const String login = 'login';
  static const String layout = 'layout';

}

extension RemoveSlash on String {
  String get removeSlash {
    try {
      if (startsWith("/")) {
        return substring(1);
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }
}

extension AddSlash on String {
  String get withSlash {
    try {
      if (startsWith("/")) {
        return this;
      } else {
        return "/$this";
      }
    } catch (e) {
      return this;
    }
  }
}
