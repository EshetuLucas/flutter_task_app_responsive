import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_text_styles.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:tasks_app/ui/views/locations.dart';
import 'package:tasks_app/ui/views/menu/menu_view.dart';
import 'package:tasks_app/ui/views/widgets/custom_drop_down.dart';
import 'package:tasks_app/ui/views/widgets/header_widget.dart';
import 'package:tasks_app/utils/menu_items_helper.dart';
import 'home_viewmodel.dart';
import 'package:get/get.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcMediumGrey,
        title: Row(
          children: [
            Expanded(
              child: HeaderWidget(
                onBackButtonTap: () =>
                    _beamerKey.currentState?.routerDelegate.beamBack(),
              ),
            ),
            ResponsiveBuilder(
              builder: (context, sizingInformation) =>
                  sizingInformation.isMobile
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomDropDown(
                                    items: TaskAppsMenuItem.menuItems,
                                    onChanged: (menuItem) => ref
                                        .read(homeViewProvider.notifier)
                                        .onMenuItemTap(menuItem!, _beamerKey)),
                                horizontalSpaceSmall,
                                LanguageOpitionWidget(
                                  textColor: kcWhite,
                                  backgroundColor: kcPrimaryColor,
                                  ref: ref,
                                  hint: const Icon(
                                    Icons.language,
                                    color: kcPrimaryColor,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            ResponsiveBuilder(
              builder: (context, sizingInformation) =>
                  !sizingInformation.isMobile
                      ? Container(
                          width: 210,
                          color: kcLightBlue,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              verticalSpaceSmall,
                              MenuView(
                                beamer: _beamerKey,
                                menuItem: TaskAppsMenuItem(
                                  uri: '/tasks',
                                  title: 'tasks'.tr,
                                  iconData: Icons.task,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              MenuView(
                                beamer: _beamerKey,
                                menuItem: TaskAppsMenuItem(
                                  uri: '/projects',
                                  title: 'projects'.tr,
                                  iconData: Icons.fact_check_outlined,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              MenuView(
                                beamer: _beamerKey,
                                menuItem: TaskAppsMenuItem(
                                  uri: '/teams',
                                  title: 'teams'.tr,
                                  iconData: Icons.groups_rounded,
                                ),
                              ),
                              verticalSpaceSmall,
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: LanguageOpitionWidget(
                                    backgroundColor: kcWhite.withOpacity(0.2),
                                    ref: ref,
                                    hint: ListTile(
                                      leading: const Icon(
                                        Icons.language,
                                        color: kcLightGrey,
                                        size: 30,
                                      ),
                                      title: Text(
                                        'language'.tr,
                                        style: ktsSmallWhiteTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
            ),
            Container(width: 1, color: Colors.blue),
            if ((context.currentBeamLocation.state as BeamState)
                .uri
                .path
                .isEmpty)
              Expanded(
                child: Center(
                  child: Text('home'.tr),
                ),
              )
            else
              Expanded(
                child: ClipRRect(
                  child: Beamer(
                    key: _beamerKey,
                    routerDelegate: BeamerDelegate(
                        transitionDelegate:
                            const NoAnimationTransitionDelegate(),
                        locationBuilder: (routeInformation, _) {
                          if (routeInformation.location!.contains('tasks')) {
                            return TasksLocation(routeInformation);
                          }
                          if (routeInformation.location!.contains('projects')) {
                            return ProjectsLocation(routeInformation);
                          }
                          if (routeInformation.location!.contains('teams')) {
                            return TeamsLocation(routeInformation);
                          }
                          return TasksLocation(routeInformation);
                        }),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LanguageOpitionWidget extends StatelessWidget {
  const LanguageOpitionWidget({
    required this.ref,
    required this.hint,
    required this.backgroundColor,
    this.textColor = kcPrimaryColor,
    Key? key,
  }) : super(key: key);

  final WidgetRef ref;
  final Widget hint;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
      onChanged: (value) =>
          ref.read(homeViewProvider.notifier).changeLanguage(value!.locale!),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      offset: const Offset(-1, 0),
      itemHeight: 60,
      dropdownWidth: 160,
      backgroundColor: backgroundColor,
      textColor: textColor,
      items: TaskAppsMenuItem.languages,
      hint: hint,
    );
  }
}
