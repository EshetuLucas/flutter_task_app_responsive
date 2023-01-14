import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/app/app.locator.dart';

import 'package:tasks_app/mixins/task_mixin.dart';
import 'package:tasks_app/service/language_service.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier with TaskMixin {
  final _languageService = locator<LanguageService>();
  void onBackButtonTap(BuildContext context) {
    Beamer.of(context).beamBack();
  }

  void onChange(TaskAppsMenuItem? taskAppsMenuItem) {}

  void changeLanguage(Locale locale) async {
    await Future.delayed(const Duration(milliseconds: 500));

    Get.updateLocale(locale);
    _languageService.currentLocale = locale;
  }
}
