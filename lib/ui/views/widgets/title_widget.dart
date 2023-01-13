import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final Function(TaskAppsMenuItem?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: ktsLargDarkTextStyle.copyWith(
                fontSize:
                    getResponsiveFontSize(context, minFont: 15, maxFont: 18),
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
        verticalSpaceSmall,
        const Divider(
          color: kcLightBlue,
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
