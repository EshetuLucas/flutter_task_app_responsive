import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

import 'menu_viewmodel.dart';

class MenuView extends ConsumerStatefulWidget {
  const MenuView({
    Key? key,
    required this.beamer,
    required this.menuItem,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamer;
  final TaskAppsMenuItem menuItem;

  @override
  ConsumerState<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends ConsumerState<MenuView> {
  void _setStateListener() => setState(() {});
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
    super.initState();
  }

  List<Widget> getWidget({
    required bool isArabic,
    required bool isSelectedMenuItem,
  }) {
    final widgets = [
      verticalSpaceSmall,
      Icon(
        widget.menuItem.iconData,
        color: isSelectedMenuItem ? kcPrimaryColor : kcLightGrey,
        size: isSelectedMenuItem ? 40 : 30,
      ),
      horizontalSpaceMedium,
      Text(
        widget.menuItem.title,
        textAlign: TextAlign.start,
        style: isSelectedMenuItem
            ? ktsMediumDarkTextStyle.copyWith(
                color: kcPrimaryColor, fontSize: 19)
            : ktsSmallWhiteTextStyle.copyWith(fontSize: 16),
      ),
    ];

    return isArabic ? widgets.reversed.toList() : widgets;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(menuViewProvider.notifier);
    final pathPattern =
        widget.beamer.currentState?.currentBeamLocation.pathPatterns.first;
    bool isSelectedMenuItem =
        pathPattern?.toString().contains(widget.menuItem.uri) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => viewModel.onMenuItemTap(
          widget.menuItem,
          widget.beamer,
        ),
        child: Row(
          mainAxisAlignment: viewModel.isArabic
              ? ArabicUIHelpers.mainAxisAlignment
              : EnglishUIHelpers.mainAxisAlignment,
          children: getWidget(
              isArabic: viewModel.isArabic,
              isSelectedMenuItem: isSelectedMenuItem),
        ),
      ),
    );
  }
}
