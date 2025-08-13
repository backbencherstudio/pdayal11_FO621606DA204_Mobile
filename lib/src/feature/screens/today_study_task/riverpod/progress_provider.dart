import 'package:flutter_riverpod/flutter_riverpod.dart';

final completedTaskCount = StateProvider.family<int, String>((ref, chapterId) => 0);

final pendingTaskCount = StateProvider.family<int, String>((ref, chapterId) => 0);

final progressProvider = StateProvider.family<double, String>((ref, chapterId) {
  final completedCount = ref.watch(completedTaskCount(chapterId));
  final pendingCount = ref.watch(pendingTaskCount(chapterId));

  if (completedCount == 0 && pendingCount == 0) {
    return 0.0;
  } else if (completedCount == 0) {
    return 0.0;
  } else if (pendingCount == 0) {
    return 1.0;
  } else {
    return completedCount / (completedCount + pendingCount);
  }
});
