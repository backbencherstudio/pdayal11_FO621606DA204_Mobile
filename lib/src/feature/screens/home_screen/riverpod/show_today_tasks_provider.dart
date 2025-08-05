import 'package:flutter_riverpod/flutter_riverpod.dart';

final showTodayTasks = StateProvider<int>((ref) => 0);

class Chapter {
  final String title;
  final String date;

  Chapter({required this.title, required this.date});
}

class ChapterListNotifier extends StateNotifier<List<Chapter>> {
  ChapterListNotifier() : super([]);

  void add(Chapter chapter) {
    state = [...state, chapter];
  }
}

final chapterListProvider = StateNotifierProvider<ChapterListNotifier, List<Chapter>>(
      (ref) => ChapterListNotifier(),
);
