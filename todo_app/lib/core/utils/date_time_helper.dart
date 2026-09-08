class DateTimeHelper {
  static int notificationIdFromTodoId(String todoId) {
    return todoId.hashCode.abs();
  }
}
