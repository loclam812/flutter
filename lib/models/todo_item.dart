class TodoItem {
  int index;
  String text;
  bool isCompleted;

  TodoItem(this.index, this.isCompleted, this.text);

  @override
  String toString() {
    return '{ $index, $isCompleted, $text }';
  }
}
