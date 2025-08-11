import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chapter_model.dart';

final showTodayTasks = StateProvider<int>((ref) => 0);


class ChapterListNotifier extends StateNotifier<List<Chapter>> {
  ChapterListNotifier() : super([]);

  void add(Chapter chapter) {
    state = [...state, chapter];
  }

  Chapter getChapterById(String chapterId) {
    return state.firstWhere((chapter) => chapter.chapterId == chapterId, orElse: () => throw Exception("Chapter not found"));
  }
}

final chapterListProvider = StateNotifierProvider<ChapterListNotifier, List<Chapter>>(
      (ref) => ChapterListNotifier(),
);

final selectedChapterId = StateProvider<String>((ref) => '');
final selectedTaskId = StateProvider.family<String, String>((ref, chapterID) => '');
