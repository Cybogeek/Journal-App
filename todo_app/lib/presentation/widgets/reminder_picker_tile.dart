import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReminderPickerTile extends StatelessWidget {
  final DateTime? reminderAt;
  final VoidCallback onPick;
  final VoidCallback onClear;

  const ReminderPickerTile({
    super.key,
    required this.reminderAt,
    required this.onPick,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = reminderAt == null
        ? 'No reminder set'
        : DateFormat('MMM d, yyyy • h:mm a').format(reminderAt!);

    return Card(
      child: ListTile(
        leading: const Icon(Icons.notifications_active_outlined),
        title: const Text('Reminder'),
        subtitle: Text(formatted),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (reminderAt != null)
              IconButton(onPressed: onClear, icon: const Icon(Icons.clear)),
            IconButton(
              onPressed: onPick,
              icon: const Icon(Icons.edit_calendar_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
