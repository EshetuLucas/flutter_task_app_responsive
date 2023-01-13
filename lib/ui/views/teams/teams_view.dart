import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/views/teams/teams_viewmodel.dart';
import 'package:get/get.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeamsViewModel>.reactive(
      viewModelBuilder: () => TeamsViewModel(),
      builder: (
        BuildContext context,
        TeamsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: kcMediumLightGrey,
          body: SafeArea(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(0.0), child: Text('teams'.tr)),
            ),
          ),
        );
      },
    );
  }
}
