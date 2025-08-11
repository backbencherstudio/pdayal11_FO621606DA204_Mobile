import 'package:flutter_riverpod/flutter_riverpod.dart';

// Track the count of completed tasks for a specific chapter
final completedTaskCount = StateProvider.family<int, String>((ref, chapterId) => 0);

// Track the count of pending tasks for a specific chapter
final pendingTaskCount = StateProvider.family<int, String>((ref, chapterId) => 0);

// Calculate progress based on completed and pending tasks for a specific chapter
final progressProvider = StateProvider.family<double, String>((ref, chapterId) {
  final completedCount = ref.watch(completedTaskCount(chapterId));  // Get completed task count
  final pendingCount = ref.watch(pendingTaskCount(chapterId));      // Get pending task count

  // Calculate progress as a fraction of completed tasks to total tasks (completed + pending)
  if (completedCount == 0 && pendingCount == 0) {
    return 0.0;  // If no tasks exist, progress is 0
  } else if (completedCount == 0) {
    return 0.0;  // If no completed tasks, progress is 0
  } else if (pendingCount == 0) {
    return 1.0;  // If no pending tasks, progress is 100%
  } else {
    return completedCount / (completedCount + pendingCount);  // Calculate progress fraction
  }
});
