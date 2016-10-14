import 'dart:html';
import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';
import 'dart:async';

@PolymerRegister('todo-renderer', template: 'todo_renderer.html')
class TodoRenderer extends PolymerElement {
  TodoDTO myTodo;
  bool editing = false;

  startEdit(Event ev, details) {
    editing = true;
  }

  finishEdit(Event ev, details) {
    editing = false;
  }

  domChanged1(Event ev,details) {

    if (editing) {
      new Future((){
        InputElement ie = this.shadowRoot.querySelector("input");
        print("Dom CHange1 : ${ie} , ${ie?.value}");
        ie.setSelectionRange(0, myTodo.text.length);
        ie.focus();
      });
    }
  }

  removeMe(Event ev,details) {
    dispatchEvent(createCustomEvent('remove-me',myTodo));
  }
}
