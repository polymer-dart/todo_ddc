import 'dart:html';
import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';

@PolymerRegister('todo-renderer',template:'todo_renderer.html')
class TodoRenderer extends PolymerElement {
  TodoDTO todo;
  bool editing = false;
  bool isDone;

  @Observe('todo.status')
  void hasChanged(_) {
    print("Status : ${todo.status} of ${todo.id}");
    isDone = todo.status;
  }

  @Observe('todo.text')
  void debug2(_) {
    print("Changed text ${todo.text} of ${todo.id}");
  }


  startEdit(Event ev,details) {
    editing = true;
  }

  finishEdit(Event ev,details) {
    editing = false;
  }
}
