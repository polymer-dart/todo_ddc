import 'package:html5/html.dart';
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
import 'package:polymer_elements/iron_validatable_behavior.dart';
import 'package:js/js.dart';

/**
 * A sample main
 */

@PolymerRegister('todo-main', template: 'todo_main.html', uses: const [
  PaperInput,
  PaperIconButton,
  IronFlexLayout,
  IronIcons,
  IronIcon,
  PaperButton,
  TodoRenderer
])
abstract class TodoMain extends PolymerElement
    implements MutableDataBehavior, MyReduxBehavior {
  String newText = "";
  @Property(statePath: 'todos')
  List<TodoDTO> todos = [];
  bool canAdd = false;

  @Observe('newText')
  void checkLen(_) {
    canAdd = newText != null && newText.isNotEmpty;
  }

  @reduxActionFactory
  static AddTodoAction addTodoAction(TodoDTO newTodo) =>
      new AddTodoAction(type: 'ADD_TODO', todo: newTodo);

  @reduxActionFactory
  static RemoveTodoAction removeTodoAction(int index) =>
      new RemoveTodoAction(type: 'REMOVE_TODO', index: index);

  addTodo(Event ev, details) async {
    //todos.add(new TodoDTO(text: newText));
    //todos = todos;
    //notifyPath('todos.${todos.length-1}');
    //push('todos', new TodoDTO(text: newText));
    Redux.dispatch(this, 'addTodoAction', [new TodoDTO(text: newText)]);
    newText = "";
  }

  void removeIt(Event ev, TodoDTO todo) {
    //todos.remove(todo);
    //todos = todos;
    DomRepeat rpt = shadowRoot.querySelector("#rpt");
    int idx = rpt.indexForElement(ev.target);
    Redux.dispatch(this, 'removeTodoAction', [idx]);
    //notifyPath('todos',todos);
  }

  connectedCallback() /*async*/ {
    super.connectedCallback();
    /*
    print("Load Observe Support");
    observe.ObserveSupport support = await observe.ObserveSupport.load();

    print("Observe support loaded");
    todos = support.makeObservable(todos, (prop, oldv, newv) {
      print("TODOS CHANGED ${prop} : ${oldv} => ${newv}");
      notifyPath('todos.${prop}');
    });

    // load metadata
    var p = await observe.getMetadata(TodoMain);
    print("Metadata : ${p['props']}");

    (p['props'] as List).forEach((String pname) {
      print("Observing :${pname}");
    });*/
  }
}
