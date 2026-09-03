import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_constants.dart';
import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.createdAt,
    required super.updatedAt,
    required super.dueDate,
    required super.colorValue,
  });

  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      dueDate: entity.dueDate,
      colorValue: entity.colorValue,
    );
  }

  factory TodoModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data() ?? {};

    final createdTs = map[FirestoreConstants.createdAt] as Timestamp?;
    final updatedTs = map[FirestoreConstants.updatedAt] as Timestamp?;
    final dueTs = map[FirestoreConstants.dueDate] as Timestamp?;

    return TodoModel(
      id: doc.id,
      userId: map[FirestoreConstants.userId] ?? '',
      title: map[FirestoreConstants.title] ?? '',
      description: map[FirestoreConstants.description] ?? '',
      isCompleted: map[FirestoreConstants.isCompleted] ?? false,
      createdAt: createdTs?.toDate() ?? DateTime.now(),
      updatedAt: updatedTs?.toDate() ?? DateTime.now(),
      dueDate: dueTs?.toDate(),
      colorValue: map[FirestoreConstants.colorValue] ?? 0xFF6750A4,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.userId: userId,
      FirestoreConstants.title: title,
      FirestoreConstants.description: description,
      FirestoreConstants.isCompleted: isCompleted,
      FirestoreConstants.createdAt: Timestamp.fromDate(createdAt),
      FirestoreConstants.updatedAt: Timestamp.fromDate(updatedAt),
      FirestoreConstants.dueDate: dueDate != null
          ? Timestamp.fromDate(dueDate!)
          : null,
      FirestoreConstants.colorValue: colorValue,
    };
  }
}
