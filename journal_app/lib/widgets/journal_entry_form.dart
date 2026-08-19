import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal_app/model/journal_model.dart';
import 'package:journal_app/provider/journal_provider.dart';

class JournalEntryForm extends ConsumerWidget {
  const JournalEntryForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text(
            'Journal Entry',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: title,
            maxLength: 60,
          ),

          TextField(
            decoration: const InputDecoration(labelText: 'Content'),
            controller: content,
            maxLines: 3,
            maxLength: 300,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (title.text.isEmpty || content.text.isEmpty) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        'Please fill in all fields',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .errorContainer,
                  ),
                );
                return;
              } else {
                ref
                    .read(journalProvider.notifier)
                    .addJournal(
                      JournalModel(
                        title: title.text,
                        content: content.text,
                        date: DateTime.now(),
                      ),
                    );

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(
                        'Journal entry added',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
            child: const Text('Save Journal', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ), // Adjust for keyboard
        ],
      ),
    );
  }
}
