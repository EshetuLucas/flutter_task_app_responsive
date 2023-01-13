import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks_app/ui/views/home/home_view.dart';
import 'package:tasks_app/ui/views/projects/projects_view.dart';
import 'package:tasks_app/ui/views/tasks/tasks_view.dart';
import 'package:tasks_app/ui/views/teams/teams_view.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('home-${DateTime.now()}'),
          title: 'Home',
          child: HomeView(),
        )
      ];
}

class TasksLocation extends BeamLocation<BeamState> {
  TasksLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/tasks'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('Tasks'),
          title: 'Tasks',
          child: TasksView(),
        )
      ];
}

class ProjectsLocation extends BeamLocation<BeamState> {
  ProjectsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/projects'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('Projects'),
          title: 'Projects',
          child: ProjectsView(),
        )
      ];
}

class TeamsLocation extends BeamLocation<BeamState> {
  TeamsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/teams'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('teams'),
          title: 'Teams',
          child: TeamsView(),
        )
      ];
}
