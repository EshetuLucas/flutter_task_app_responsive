import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';

import 'menu_viewmodel.dart';

class MenuView extends StatefulWidget {
  const MenuView({
    Key? key,
    required this.beamer,
    required this.menuItem,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamer;
  final TaskAppsMenuItem menuItem;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  void _setStateListener() => setState(() {});
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pathPattern =
        widget.beamer.currentState?.currentBeamLocation.pathPatterns.first;
    bool isSelectedMenuItem =
        pathPattern?.toString().contains(widget.menuItem.uri) ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: Icon(
          widget.menuItem.iconData,
          color: isSelectedMenuItem ? kcPrimaryColor : kcLightGrey,
          size: isSelectedMenuItem ? 40 : 30,
        ),
        title: Text(
          widget.menuItem.title,
          style: isSelectedMenuItem
              ? ktsMediumDarkTextStyle.copyWith(
                  color: kcPrimaryColor, fontSize: 19)
              : ktsSmallWhiteTextStyle.copyWith(fontSize: 16),
        ),
        onTap: () => MenuViewModel().onMenuItemTap(
          widget.menuItem,
          widget.beamer,
        ),
      ),
    );
  }
}
