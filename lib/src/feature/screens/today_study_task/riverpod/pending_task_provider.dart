import 'package:flutter_riverpod/flutter_riverpod.dart';

final showPendingTasks = StateProvider<int>((ref) => 0);

class Chapter {
  final String title;
  final String date;

  Chapter({required this.title, required this.date});
}

class PendingTaskListNotifier extends StateNotifier<List<Chapter>> {
  PendingTaskListNotifier() : super([]);

  void add(Chapter chapter) {
    state = [...state, chapter];
  }
}

final pendingTaskListProvider = StateNotifierProvider<PendingTaskListNotifier, List<Chapter>>(
      (ref) => PendingTaskListNotifier(),
);
