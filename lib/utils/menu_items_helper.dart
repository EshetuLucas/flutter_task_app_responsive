import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAppsMenuItem {
  final String title;
  final IconData? iconData;
  final String uri;
  final Locale? locale;

  TaskAppsMenuItem({
    required this.title,
    this.iconData,
    required this.uri,
    this.locale,
  });

  static List<TaskAppsMenuItem> get menuItems => [
        TaskAppsMenuItem(
          uri: '/tasks',
          title: 'tasks'.tr,
          iconData: Icons.task,
        ),
        TaskAppsMenuItem(
          uri: '/projects',
          title: 'projects'.tr,
          iconData: Icons.note_alt_rounded,
        ),
        TaskAppsMenuItem(
          uri: '/teams',
          title: 'teams'.tr,
          iconData: CupertinoIcons.group,
        ),
      ];

  static List<TaskAppsMenuItem> get languages => [
        TaskAppsMenuItem(
          uri: '',
          title: 'english'.tr,
          locale: const Locale('en', 'US'),
        ),
        TaskAppsMenuItem(
          uri: '',
          title: 'arabic'.tr,
          locale: const Locale('ar', 'AE'),
        ),
      ];
}
