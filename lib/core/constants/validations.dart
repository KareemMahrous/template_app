class Validations {
  static bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    return emailRegExp.hasMatch(email);
  }

  static bool isPhoneValid(String phone) {
    final RegExp phoneRegExp = RegExp(r'^01(?:1|2|0|5)\d{8}$');
    return phoneRegExp.hasMatch(phone);
  }
}
