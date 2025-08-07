import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/resource_model.dart';

final showResourceCard = StateProvider<int>((ref) => 0);



class ResourceListNotifier extends StateNotifier<List<Resource>> {
  ResourceListNotifier() : super([]);

  void add(Resource chapter) {
    state = [...state, chapter];
  }
}

final resourceListProvider = StateNotifierProvider<ResourceListNotifier, List<Resource>>(
      (ref) => ResourceListNotifier(),
);
