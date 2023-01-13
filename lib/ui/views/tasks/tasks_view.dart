import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tasks_app/ui/views/widgets/description_widget.dart';
import 'package:tasks_app/ui/views/widgets/tasks_widget.dart';
import 'package:tasks_app/ui/views/tasks/tasks_viewmodel.dart';

class TasksView extends ConsumerWidget {
  TasksView({
    Key? key,
  }) : super(key: key);
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TaskWidget(
              ref: ref,
              screenSize: sizingInformation.screenSize.width,
              onChanged: (menuItem) => sizingInformation.isMobile
                  ? ref
                      .read(tasksViewProvider.notifier)
                      .onMenuItemTap(menuItem!, _beamerKey)
                  : null,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          if (sizingInformation.screenSize.width > 1100)
            Expanded(
              child: DescriptionWidget(
                task: ref.read(tasksViewProvider.notifier).selectedTask,
              ),
            ),
        ],
      ),
    );
  }
}
