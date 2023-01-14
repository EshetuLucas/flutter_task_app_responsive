import 'dart:ui';

class LanguageService {
  Locale _currentLocale = const Locale('en', 'US');
  Locale get currentLocale => _currentLocale;
  set currentLocale(value) => _currentLocale = value;

  bool get isArabic => currentLocale.languageCode == 'ar';
}
