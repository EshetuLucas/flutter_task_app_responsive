import 'package:tasks_app/data_model/task/task.dart';

class NetworkService {
  final now = DateTime.now();
  List<Task> get getTasks => [
        Task(
          id: '1',
          title: 'Read emails from mailbox',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '2',
          title: 'Check latest news on Flutter',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '3',
          title: 'Have a call with Flutter team',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '4',
          title: 'Work on application performance',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '5',
          title: 'Plan work for next week',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '6',
          title: 'Order lunch',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
        Task(
          id: '7',
          title: 'Create an invoice for last month',
          dateTime: now,
          description:
              'Loam soils contain sand, silt and clay in such proportions that stickyness and non-adhesiveness are in balance - so the soils are mouldable but not sticky. Loams are the "friendliest" soils to cultivate. Clays can absorb and hold onto large amounts of water because of their sheet structure and large surface area.',
        ),
      ];
}
