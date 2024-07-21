abstract class Routes {

  static const String login = 'login';
  static const String layout = 'layout';

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
