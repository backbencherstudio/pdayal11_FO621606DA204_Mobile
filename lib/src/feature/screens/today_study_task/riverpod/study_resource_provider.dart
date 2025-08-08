import 'package:flutter_riverpod/flutter_riverpod.dart';

final showResourceCard = StateProvider<int>((ref) => 0);

class Chapter {
  final String title;
  final String urlOrNote;

  Chapter({required this.title, required this.urlOrNote});
}

class ResourceListNotifier extends StateNotifier<List<Chapter>> {
  ResourceListNotifier() : super([]);

  void add(Chapter chapter) {
    state = [...state, chapter];
  }
}

final resourceListProvider = StateNotifierProvider<ResourceListNotifier, List<Chapter>>(
      (ref) => ResourceListNotifier(),
);
