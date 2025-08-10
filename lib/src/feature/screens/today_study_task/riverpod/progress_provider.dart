import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/chapter_id_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';
import 'completed_task_list_provider.dart';

final progressProvider = StateProvider<double>((ref) {// Watch selected chapterId
  final id = ref.watch(selectedChapterId);
  final pendingTasks = ref.watch(pendingTaskListProvider); // List of all pending tasks
  final completedTasks = ref.watch(completedTaskListProvider); // List of all completed tasks

  // Filter tasks by the selected chapterId
  final filteredPendingTasks = pendingTasks.where((task) => task.chapterID == id).toList();
  final filteredCompletedTasks = completedTasks.where((task) => task.chapterID == id).toList();

  // Calculate total tasks and completed tasks for the selected chapter
  final totalTasks = filteredPendingTasks.length + filteredCompletedTasks.length;
  final completedTaskCount = filteredCompletedTasks.length;

  // Calculate the progress ratio
  return totalTasks == 0 ? 0.0 : completedTaskCount / totalTasks;
});
