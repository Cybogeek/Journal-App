import '../data/sample_data.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/models/fitness_topic_model.dart';

final nutrifitProvider = NotifierProvider<NutrifitNotifier, List<FitnessTopic>>(
  NutrifitNotifier.new,
);

class NutrifitNotifier extends Notifier<List<FitnessTopic>> {
  @override
  List<FitnessTopic> build() {
    state = FitnessData.topics;
    return FitnessData.topics;
  }

  FitnessTopic? searchTopicByIndex(String index) {
    try {
      return state.firstWhere((topic) => topic.id == index);
    } catch (e) {
      return null;
    }
  }

  List<FitnessTopic> searchTopicsByCategory(Category category) {
    return state.where((topic) => topic.category == category).toList();
  }

  List<FitnessTopic> searchTopicsByDifficulty(DifficultyLevel difficulty) {
    return state.where((topic) => topic.difficulty == difficulty).toList();
  }
}
