import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:tasks_app/ui/views/tasks/tasks_viewmodel.dart';
import 'package:tasks_app/ui/views/widgets/description_widget.dart';
import 'package:tasks_app/ui/views/widgets/title_widget.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';
import 'package:get/get.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    this.onChanged,
    required this.ref,
    this.screenSize = 1100,
  }) : super(key: key);
  final double screenSize;
  final WidgetRef ref;
  final Function(TaskAppsMenuItem?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kcLightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: [
            TitleWidget(
              title: 'tasks'.tr,
              onChanged: onChanged,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: ref.read(tasksViewProvider.notifier).getTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final task =
                      ref.read(tasksViewProvider.notifier).getTasks[index];
                  final isSelectedTask =
                      ref.watch(tasksViewProvider).selectedTask == task;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        elevation: isSelectedTask ? 0 : 1,
                        color: isSelectedTask ? kcPrimaryColor : kcMediumGrey,
                        child: Padding(
                          padding: isSelectedTask
                              ? const EdgeInsets.all(4.0)
                              : EdgeInsets.zero,
                          child: ListTile(
                            onTap: () => ref
                                .read(tasksViewProvider.notifier)
                                .onTaskSelect(task),
                            title: Text(
                              task.title,
                              style: isSelectedTask
                                  ? ktsWhiteMediumTextStyle
                                  : ktsDarkSmallTextStyle.copyWith(
                                      fontSize: getResponsiveFontSize(context,
                                          minFont: 13, maxFont: 16),
                                    ),
                            ),
                            trailing: Text(
                              task.dateTime.toString(),
                              style: isSelectedTask
                                  ? ktsWhiteSmallTextStyle
                                  : ktsSmallDarkTextStyle,
                            ),
                          ),
                        ),
                      ),
                      if (isSelectedTask && screenSize < 1100) ...[
                        verticalSpaceSmall,
                        Padding(
                          padding: appLeftEdgePadding,
                          child: Text(
                            'description'.tr,
                            style: ktsBoldMeidumDarkTextStyle.copyWith(
                                color: kcPrimaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          child: DescriptionBodyWidget(task: task),
                        )
                      ]
                    ],
                  );
                },
                separatorBuilder: (_context, index) => verticalSpaceSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
