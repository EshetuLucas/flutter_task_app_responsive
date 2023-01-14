import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.onChanged,
    this.hint,
    required this.items,
    this.backgroundColor = kcLightBlue,
    this.textColor = kcWhite,
    this.buttonHeight = 10,
    this.itemHeight = 100,
    this.dropdownWidth = 200,
    this.borderRadius,
    this.offset = const Offset(-160, 0),
  }) : super(key: key);

  final Widget? hint;
  final Function(TaskAppsMenuItem?)? onChanged;
  final List<TaskAppsMenuItem> items;
  final Color backgroundColor;
  final Color textColor;
  final double buttonHeight;
  final double itemHeight;
  final double dropdownWidth;
  final Offset offset;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: hint,
        customButton: hint ??
            const Icon(
              Icons.menu_rounded,
              size: 40,
              color: kcPrimaryColor,
            ),
        buttonHeight: buttonHeight,
        buttonWidth: 5,
        itemHeight: itemHeight,
        items: [
          ...items.map(
            (item) => DropdownMenuItem<TaskAppsMenuItem>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  leading: item.iconData != null
                      ? Icon(
                          item.iconData,
                          color: kcLightGrey,
                          size: 30,
                        )
                      : null,
                  title: Text(
                    item.title,
                    style: ktsSmallWhiteTextStyle.copyWith(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          onChanged?.call(value as TaskAppsMenuItem);
        },
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: dropdownWidth,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 30),
        dropdownDecoration: BoxDecoration(
          borderRadius: borderRadius ??
              const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
          color: backgroundColor,
        ),
        dropdownElevation: 8,
        offset: offset,
      ),
    );
  }
}

class MenuItems {
  static List<TaskAppsMenuItem> firstItems = TaskAppsMenuItem.menuItems;

  static Widget buildItem(TaskAppsMenuItem item) {
    return Row(
      children: [
        Icon(item.iconData, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
