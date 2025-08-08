import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chapter_model.dart';

final showTodayTasks = StateProvider<int>((ref) => 0);


class ChapterListNotifier extends StateNotifier<List<Chapter>> {
  ChapterListNotifier() : super([]);

  void add(Chapter chapter) {
    state = [...state, chapter];
  }
}

final chapterListProvider = StateNotifierProvider<ChapterListNotifier, List<Chapter>>(
      (ref) => ChapterListNotifier(),
);

final selectedChapterId = StateProvider<String>((ref) => '');
