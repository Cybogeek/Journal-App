import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/data/journal_data.dart';
import 'package:journal_app/model/journal_model.dart';

class JournalNotifier extends Notifier<List<JournalModel>> {
  final List<JournalModel> _journals = sampleJournals;
  List<JournalModel> get journals => _journals;
  JournalModel addJournal(JournalModel journal) {
    state = [...state, journal];
    _journals.add(journal);
    return journal;
  }

  JournalModel deleteJournal(int index) {
    final deletedJournal = _journals[index];
    state = [...state]..removeAt(index);
    _journals.removeAt(index);
    return deletedJournal;
  }

  @override
  List<JournalModel> build() {
    return _journals;
  }
}

final journalProvider = NotifierProvider<JournalNotifier, List<JournalModel>>(
  JournalNotifier.new,
);
