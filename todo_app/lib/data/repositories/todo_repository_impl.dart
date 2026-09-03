import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<TodoEntity>> getTodos(String userId) {
    return remoteDataSource.getTodos(userId);
  }

  @override
  Future<void> addTodo(TodoEntity todo) {
    return remoteDataSource.addTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> updateTodo(TodoEntity todo) {
    return remoteDataSource.updateTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo({required String userId, required String todoId}) {
    return remoteDataSource.deleteTodo(userId: userId, todoId: todoId);
  }

  @override
  Future<void> toggleTodo(TodoEntity todo) {
    return remoteDataSource.toggleTodo(TodoModel.fromEntity(todo));
  }
}
