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
abstract class TodoMain extends PolymerElement implements MyReduxBehavior,MutableData {
  String newText = "";
  @Property(statePath: 'todos')
  List<TodoDTO> todos = [];
  bool canAdd = false;

  @Observe('newText')
  void checkLen(_) {
    canAdd = newText != null && newText.isNotEmpty;
  }

  @reduxActionFactory
  static ReduxAction<TodoDTO> addTodoAction(TodoDTO newTodo) =>
      Actions.createAddTodoAction(newTodo);

  @reduxActionFactory
  static ReduxAction<int> removeTodoAction(int index) =>
      Actions.createRemoveTodoAction(index);

  addTodo(Event ev, details) async {
    Redux.dispatch(this, 'addTodoAction', [new TodoDTO(text: newText)]);
    newText = "";
  }

  void removeIt(Event ev, TodoDTO todo) {
    DomRepeat rpt = shadowRoot.querySelector("#rpt");
    int idx = rpt.indexForElement(ev.target);
    Redux.dispatch(this, 'removeTodoAction', [idx]);
  }
}
