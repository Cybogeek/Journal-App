import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/provider/journal_provider.dart';
import 'package:journal_app/widgets/journal_card.dart';
import 'package:journal_app/widgets/journal_entry_form.dart';

class JournalEntry extends StatefulWidget {
  const JournalEntry({super.key, required this.title});
  final String title;

  @override
  State<JournalEntry> createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                final journals = ref.watch(journalProvider);
                return journals.isEmpty
                    ? Center(
                        child: Text(
                          'No Journal entries yet. Tap the + button to add one!',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: journals.length, // Example item count
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ValueKey(index),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              ref
                                  .read(journalProvider.notifier)
                                  .deleteJournal(index);
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      'Journal entry deleted',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .errorContainer,
                                ),
                              );
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            child: JournalCard(
                              index: index,
                              entry: journals[index],
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press
          _showAddJournalModel(context);
        },
        tooltip: 'Add Journal Entry',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddJournalModel(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints.expand(),
      context: context,
      builder: (BuildContext context) {
        return JournalEntryForm();
      },
    );
  }
}
