import 'package:flutter/material.dart';
import 'package:tasks_app/data_model/task/task.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';

import '../../common/app_colors.dart';
import 'title_widget.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kcLightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: [
            TitleWidget(
              title: task.title,
            ),
            Expanded(child: DescriptionBodyWidget(task: task))
          ],
        ),
      ),
    );
  }
}

class DescriptionBodyWidget extends StatelessWidget {
  const DescriptionBodyWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.dateTime.toIso8601String(),
          style: ktsDarkSmallTextStyle.copyWith(
            fontSize: getResponsiveFontSize(context, minFont: 15, maxFont: 18),
          ),
        ),
        verticalSpaceSmall,
        Text(
          task.description,
          style: ktsDarkSmallTextStyle.copyWith(
            fontSize: getResponsiveFontSize(context,
                fontSize: 14, maxFont: 20, minFont: 14),
          ),
        )
      ],
    );
  }
}
