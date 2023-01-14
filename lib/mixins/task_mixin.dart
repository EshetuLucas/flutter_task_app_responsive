import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stacked/stacked.dart';
import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/data_model/task/task.dart';
import 'package:tasks_app/service/language_service.dart';
import 'package:tasks_app/service/network_service.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

mixin TaskMixin on ChangeNotifier {
  final _networkService = locator<NetworkService>();
  final _languageService = locator<LanguageService>();
  bool get isArabic => _languageService.isArabic;

  List<Task> get getTasks => _networkService.getTasks;
  List<TaskAppsMenuItem> get menuItems => TaskAppsMenuItem.menuItems;

  late Task? _selectedTask = getTasks[0];
  Task get selectedTask => _selectedTask!;

  void onTaskSelect(Task task) {
    _selectedTask = task;
    notifyListeners();
  }

  void onMenuItemTap(
      TaskAppsMenuItem taskAppsMenuItem, GlobalKey<BeamerState> _beamerKey) {
    _beamerKey.currentState?.routerDelegate.beamToNamed(taskAppsMenuItem.uri);
  }
}
