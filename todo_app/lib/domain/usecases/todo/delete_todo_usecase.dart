import '../../repositories/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository repository;

  DeleteTodoUseCase(this.repository);

  Future<void> call({required String userId, required String todoId}) {
    return repository.deleteTodo(userId: userId, todoId: todoId);
  }
}
