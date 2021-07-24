class TodoItem {
  int uuid;
  String text;
  bool isCompleted;

  TodoItem(this.uuid, this.isCompleted, this.text);

  @override
  String toString() {
    return '{ $uuid, $isCompleted, $text }';
  }
}
