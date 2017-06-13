import 'dart:async';
import 'package:html5/html.dart';
import 'package:polymer_element/dart_callbacks_behavior.dart';
import 'package:polymer_element/redux_local.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:todo_common/model.dart';
import 'package:todo_renderer/todo_renderer.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/iron_validatable_behavior.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:polymer_element/super.dart';
import 'package:polymer_elements/iron_meta.dart';
import 'package:polymer_elements/app_localstorage_document.dart';
import 'package:polymer_elements/app_header_layout.dart';
import 'package:polymer_elements/app_header.dart';
import 'package:polymer_elements/app_toolbar.dart';
import 'package:polymer_elements/app_scroll_effects.dart';
import 'package:polymer_element/observe.dart';
import 'todo_list.dart';


@PolymerBehavior("Sample.MyBehavior")
abstract class MyBehavior implements DartCallbacksBehavior {
  String myProp;

  // TODO : THIS STILL NOT WORKING
  @Observe('myProp')
  void checkObserveOnBehavior(_) {
    print("My Prop has changed in a behavior (changed) :${myProp}");
  }

  void readyPostHook() {
    myProp = 'Hello from a behavior';
  }

  doSomething(Event ev, detail) {
    myProp = 'And now has changed';
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

@PolymerRegister('todo-main', template: 'todo_main.html')
abstract class TodoMain extends PolymerElement implements MyReduxBehavior, MutableData, IronValidatableBehavior {
  String newText;
  @Property(statePath: 'todos')
  List<TodoDTO> todos = [];

  List<TodoDTO> todos2= [];

  bool canAdd;

  @Property(statePath:'jsonData')
  String jsonData;

  @Observe('jsonData')
  void restoreJson() {
    if (jsonData!=null) {
      print("DISPATCHING RESTORE DATA FOR ${jsonData}");
      dispatch(new ReduxAction<String>(type: 'RESTORE_DATA', detail: jsonData));
    }
  }

  @Observe('newText')
  void checkLen(_) {
    set('canAdd', newText != null && newText.isNotEmpty);
    print("New  text changed, can add : ${canAdd}");
  }

  TodoMain() {
  }

  aTodoChanged(CustomEvent ev) {
    int pos = rpt.indexForElement(ev.target);
    print("TODO CHANGED  :${pos} , ${ev.detail}");
    dispatch(todoChanged(ev.detail['new'], pos));
  }

  connectedCallback() {
    super.connectedCallback();
    newText = "";
    todos2 = observeSupport.makeObservable([]);
  }

  static ReduxAction todoChanged(TodoDTO newtodo, int at) => Actions.createUpdateTodoAction(newtodo, at);

  static ReduxAction<TodoDTO> addTodoAction(TodoDTO newTodo) => Actions.createAddTodoAction(newTodo);

  static ReduxAction<int> removeTodoAction(int index) => Actions.createRemoveTodoAction(index);

  addTodo(Event ev, details) async {
    dispatch(addTodoAction(new TodoDTO(text: newText)));
    todos2.add(new TodoDTO(text:newText));
    newText = "";
  }

  DomRepeat get rpt => shadowRoot.querySelector("#rpt");

  void removeIt(Event ev, TodoDTO todo) {
    int idx = rpt.indexForElement(ev.target);
    dispatch(removeTodoAction(idx));
  }
}
