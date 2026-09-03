import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  Stream<List<TodoEntity>> call(String userId) => repository.getTodos(userId);
}
