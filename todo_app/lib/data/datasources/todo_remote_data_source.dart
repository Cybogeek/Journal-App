import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_constants.dart';
import '../../core/error/app_exception.dart';
import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoModel>> getTodos(String userId);

  Future<void> addTodo(TodoModel todo);

  Future<void> updateTodo(TodoModel todo);

  Future<void> deleteTodo({required String userId, required String todoId});

  Future<void> toggleTodo(TodoModel todo);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firestore;

  TodoRemoteDataSourceImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> _todoRef(String userId) {
    return firestore
        .collection(FirestoreConstants.usersCollection)
        .doc(userId)
        .collection(FirestoreConstants.todosCollection);
  }

  @override
  Stream<List<TodoModel>> getTodos(String userId) {
    return _todoRef(userId)
        .orderBy(FirestoreConstants.createdAt, descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map(TodoModel.fromFirestore).toList();
        });
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    try {
      await _todoRef(todo.userId).doc(todo.id).set(todo.toMap());
    } catch (e) {
      throw AppException('Failed to add todo');
    }
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    try {
      await _todoRef(todo.userId).doc(todo.id).update(todo.toMap());
    } catch (e) {
      throw AppException('Failed to update todo');
    }
  }

  @override
  Future<void> deleteTodo({
    required String userId,
    required String todoId,
  }) async {
    try {
      await _todoRef(userId).doc(todoId).delete();
    } catch (e) {
      throw AppException('Failed to delete todo');
    }
  }

  @override
  Future<void> toggleTodo(TodoModel todo) async {
    try {
      await _todoRef(todo.userId).doc(todo.id).update({
        FirestoreConstants.isCompleted: !todo.isCompleted,
        FirestoreConstants.updatedAt: Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw AppException('Failed to update todo status');
    }
  }
}
