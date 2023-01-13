import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/mixins/task_mixin.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

final menuViewProvider = ChangeNotifierProvider((ref) => MenuViewModel());

class MenuViewModel extends ChangeNotifier with TaskMixin {
  void onBackButtonTap(BuildContext context) {
    Beamer.of(context).beamBack();
  }

  void onChange(TaskAppsMenuItem? taskAppsMenuItem) {}
}
