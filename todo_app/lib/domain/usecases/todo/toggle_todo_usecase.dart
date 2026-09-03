import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

class ToggleTodoUseCase {
  final TodoRepository repository;

  ToggleTodoUseCase(this.repository);

  Future<void> call(TodoEntity todo) => repository.toggleTodo(todo);
}
