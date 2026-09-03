import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Stream<List<TodoEntity>> getTodos(String userId);

  Future<void> addTodo(TodoEntity todo);

  Future<void> updateTodo(TodoEntity todo);

  Future<void> deleteTodo({required String userId, required String todoId});

  Future<void> toggleTodo(TodoEntity todo);
}
