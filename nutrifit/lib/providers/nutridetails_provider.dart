import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/data/sample_data.dart';
import 'package:nutrifit/models/nutrition_details_model.dart';

class NutridetailsNotifier extends Notifier<List<DetailedInstruction>> {
  @override
  List<DetailedInstruction> build() {
    return FitnessData.instructions;
  }

  List<DetailedInstruction> searchInstructionsByTopicId(String topicId) {
    return state
        .where((instruction) => instruction.topicId == topicId)
        .toList();
  }

  DetailedInstruction? searchInstructionById(String id) {
    try {
      return state.firstWhere((instruction) => instruction.id == id);
    } catch (e) {
      return null;
    }
  }

  void addnewInstruction(DetailedInstruction instruction) {
    state.add(instruction);
    state = [...state, instruction];
  }
}

final nutridetailsProvider =
    NotifierProvider<NutridetailsNotifier, List<DetailedInstruction>>(
      NutridetailsNotifier.new,
    );
