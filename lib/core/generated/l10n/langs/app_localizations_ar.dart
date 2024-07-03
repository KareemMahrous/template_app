import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLangAr extends AppLang {
  AppLangAr([String locale = 'ar']) : super(locale);

  @override
  String get somethingWentWrongMsg => 'عذراً، حدث خطأ ما!';

  @override
  String get subscribe => 'اشترك';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'تسجيل';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get city => 'المدينة';
}
