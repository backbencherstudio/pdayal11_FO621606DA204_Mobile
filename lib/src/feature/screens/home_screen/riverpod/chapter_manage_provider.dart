import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chapter_model.dart';

class ChapterNotifier extends StateNotifier<Map<String, Chapter>> {
  ChapterNotifier() : super({});

  // Add or update a chapter
  void addChapter(Chapter chapter) {
    state = {
      ...state,
      chapter.chapterId: chapter,
    };
  }

  // Get chapter by ID
  Chapter? getChapter(String chapterId) {
    return state[chapterId];
  }
}

// StateNotifierProvider for Chapter
final chapterProvider = StateNotifierProvider<ChapterNotifier, Map<String, Chapter>>(
      (ref) => ChapterNotifier(),
);
