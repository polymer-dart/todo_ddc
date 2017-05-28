import 'package:html5/html.dart';
import 'package:polymer_element/observe.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:todo_common/model.dart';
import 'package:todo_renderer/todo_renderer.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_button.dart';

class MyObservedObject {
  String myNestedProperty;
  MyObservedObject mySubNestedProperty;
}


@PolymerRegister('todo-list',template: 'todo_list.html')
abstract class TodoList extends PolymerElement implements AutonotifyBehavior {
  List<TodoDTO> todos;


  MyObservedObject myObservedObject;

  String newNestedValue;

  DomRepeat get rpt=>shadowRoot.querySelector("#rpt");

  void removeMe(CustomEvent ev) {
    int p  = rpt.indexForElement(ev.target);
    todos.removeAt(p);
  }

  @Observe('newNestedValue')
  void updateNestedValue(_) {
    // Note this normally won't trigger a notify (it's a nested prop).
    // But 'AutonotifyBehavior' will make it happen...
    myObservedObject.myNestedProperty = newNestedValue;
    myObservedObject.mySubNestedProperty.myNestedProperty = newNestedValue;
  }

  @override
  connectedCallback() {
    super.connectedCallback();
    myObservedObject = new MyObservedObject()
      ..mySubNestedProperty = new MyObservedObject();
  }


}