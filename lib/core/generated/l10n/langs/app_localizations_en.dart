import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLangEn extends AppLang {
  AppLangEn([String locale = 'en']) : super(locale);

  @override
  String get somethingWentWrongMsg => 'Sorry, something went wrong!';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get city => 'City';

  @override
  String get pleaseTryAgain => 'Please try again';
}
