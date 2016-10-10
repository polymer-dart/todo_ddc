import 'dart:html';
import 'package:polymer_element/polymer_element.dart';
import 'package:todo_common/model.dart';

@PolymerRegister('todo-main', template: 'todo_main.html')
class TodoMain extends PolymerElement {
  String newText;
  List<TodoDTO> todos = [];
  bool canAdd = false;

  @Observe('newText')
  void checkLen(_) {
    canAdd = newText != null && newText.isNotEmpty;
  }

  void addTodo(Event ev, details) {
    todos = todos..add(new TodoDTO(text: newText));
    newText = "";
  }

  void removeIt(Event ev,TodoDTO todo) {
    todos = todos
      ..remove(todo);
  }
}
