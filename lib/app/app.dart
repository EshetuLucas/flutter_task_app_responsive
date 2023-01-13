import 'package:stacked/stacked_annotations.dart';
import 'package:tasks_app/service/network_service.dart';
import 'package:tasks_app/ui/views/tasks/tasks_viewmodel.dart';
// @stacked-import

@StackedApp(routes: [
  // @stacked-route
], dependencies: [
  LazySingleton(classType: TasksViewModel),
  // core-service
  LazySingleton(classType: NetworkService),
])
class App {}
