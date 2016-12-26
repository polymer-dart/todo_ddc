import 'dart:html';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:todo_common/model.dart';
import 'package:polymer_element/observe.dart' as observe;
import 'package:todo_renderer/todo_renderer.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_button.dart';

/**
 * A sample main
 */

@PolymerRegister('todo-main', template: 'todo_main.html', uses: const [PaperInput, PaperIconButton, IronFlexLayout, IronIcons, IronIcon, PaperButton, TodoRenderer])
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

  connectedCallback() async {
    super.connectedCallback();
    print("Load Observe Support");
    observe.ObserveSupport support = await observe.ObserveSupport.load();

    print("Observe support loaded");
    todos = support.makeObservable(todos, (prop, oldv, newv) {
      print("TODOS CHANGED ${prop} : ${oldv} => ${newv}");
      notifyPath('todos.${prop}');
    });
  }
}
