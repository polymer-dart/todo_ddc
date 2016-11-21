import 'dart:html';
import 'package:polymer_element/polymer_element.dart';
import 'package:todo_common/model.dart';
import 'package:polymer_element/observe.dart' as observe;
import 'package:todo_renderer/todo_renderer.dart';

/**
 * A sample main
 */

@PolymerRegister('todo-main', template: 'todo_main.html', uses:const [TodoRenderer])
class TodoMain extends PolymerElement {
  String newText = "";
  List<TodoDTO> todos = [];
  bool canAdd = false;

  @Observe('newText')
  void checkLen(_) {
    canAdd = newText != null && newText.isNotEmpty;
  }

  addTodo(Event ev, details) async {
    todos.add(new TodoDTO(text: newText));
    newText = "";
  }

  void removeIt(Event ev, TodoDTO todo) {
    todos.remove(todo);
  }

  void connectedCallback() {
    super.connectedCallback();
    print("Load Observe Support");
    observe.whenReady.then((_) {
      print("Observe support loaded");
      todos = observe.makeObservable(todos, (prop,oldv,newv) {
        print("TODOS CHANGED ${prop} : ${oldv} => ${newv}");
        notifyPath('todos.${prop}');
      });
    });
  }
}
