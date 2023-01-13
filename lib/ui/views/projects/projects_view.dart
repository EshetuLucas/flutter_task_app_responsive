import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:get/get.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcMediumLightGrey,
      body: SafeArea(
        child: Center(child: Text('projects'.tr)),
      ),
    );
  }
}
