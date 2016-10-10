import 'dart:html';
import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';

@PolymerRegister('todo-renderer', template: 'todo_renderer.html')
class TodoRenderer extends PolymerElement {
  TodoDTO myTodo;
  bool editing = false;

  startEdit(Event ev, details) {
    editing = true;
    InputElement ie = this.shadowRoot.querySelector("input");
    ie.setSelectionRange(0, myTodo.text.length);
    ie.focus();
  }

  finishEdit(Event ev, details) {
    editing = false;
  }

  removeMe(Event ev,details) {
    dispatchEvent(createCustomEvent('remove-me',myTodo));
  }
}
