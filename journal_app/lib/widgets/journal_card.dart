import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:journal_app/model/journal_model.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({super.key, required this.index, required this.entry});
  final int index;
  final JournalModel entry;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 4.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        title: Text(
          entry.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(entry.content, style: const TextStyle(fontSize: 16)),
        trailing: Text(
          DateFormat('yyyy-MM-dd').format(entry.date),
          style: const TextStyle(fontSize: 14, color: Colors.black26),
        ),
      ),
    );
  }
}
