import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/enums/language_type.dart';
import 'package:tasks_app/service/language_service.dart';
import 'package:tasks_app/ui/views/locations.dart';
import 'package:tasks_app/utils/language.dart';
import 'ui/common/app_colors.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final languageService = locator<LanguageService>();
  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Language(), // your translations
      locale: const Locale(
          'en', 'US'), // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'UK'),
      home: ProviderScope(
        child: Directionality(
          // add this
          textDirection: languageService.currentLocale == LanguageType.arabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: MaterialApp.router(
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: kcMediumGrey,
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  fontSize: 14.0,
                  color: kcDarkGreyColor,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
          ),
        ),
      ),
    );
  }
}
