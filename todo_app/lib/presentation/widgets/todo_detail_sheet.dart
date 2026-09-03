import 'package:flutter/material.dart';

import '../../domain/entities/todo_entity.dart';

class TodoDetailSheet extends StatelessWidget {
  final TodoEntity todo;

  const TodoDetailSheet({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final color = Color(todo.colorValue);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(backgroundColor: color, radius: 10),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  todo.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(todo.description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                todo.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: todo.isCompleted ? Colors.green : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(todo.isCompleted ? 'Completed' : 'Pending'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
