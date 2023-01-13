import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tasks_app/data_model/task/task.dart';
import 'package:tasks_app/ui/views/widgets/description_widget.dart';

import 'description_viewmodel.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    Key? key,
    required this.task,
    required this.deviceScreenType,
  }) : super(key: key);
  final Task task;
  final DeviceScreenType deviceScreenType;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DescriptionViewModel>.reactive(
      viewModelBuilder: () => DescriptionViewModel(),
      builder: (
        BuildContext context,
        DescriptionViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: DescriptionWidget(
            task: task,
          ),
        );
      },
    );
  }
}
