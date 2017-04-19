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
import 'package:js/js_util.dart';
import 'package:polymer_element/super.dart';
import 'package:polymer_elements/iron_meta.dart';

@PolymerBehavior("Sample.MyBehavior")
abstract class MyBehavior  {
  String myProp;

  void ready() {
    // We have to call super otherwise polymer will brake
    // NOTE: this is true in JS true but they have a more natural way to do it
    callSuper(this,'ready');
    myProp='Hello from a behavior';
    //m.byKey('info')
  }

  doSomething(Event ev, detail) {
    myProp='And now has changed';
  }
}

@PolymerRegister('test-comp')
abstract class MyTestComp extends PolymerElement implements MyBehavior {
  static String get template => """
<style>
 :host {
    display: block;
 }

 h2 {
   color:red;
 }
</style>
<div on-click='doSomething'>
  <h2 >Hello, man! Embedded template here! </h2>
  <div>This value comes from a dart behavior (click to changeit):  <b> [[myProp]]</b></div>
  </div>
""";
}

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
    implements MyReduxBehavior, MutableData, IronValidatableBehavior {
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
