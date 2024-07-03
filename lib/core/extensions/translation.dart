import 'package:flutter/material.dart';

import '../generated/langs.dart';

/// An extension on [BuildContext] to facilitate translation and text direction.
extension Translation on BuildContext {
  /// Returns the localized strings for the current context.
  /// If no localization is found, it defaults to [AppLangEn].
  AppLang get tr => AppLang.of(this) ?? AppLangEn();

  /// Returns the text direction for the current locale, either [TextDirection.ltr]
  /// (left-to-right) or [TextDirection.rtl] (right-to-left).
  TextDirection get direction => WidgetsLocalizations.of(this).textDirection;
}
