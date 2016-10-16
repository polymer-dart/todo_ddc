import 'dart:html';
import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:polymer_element/paper_dialog.dart';
import 'dart:async';

@PolymerRegister('todo-renderer', template: 'todo_renderer.html')
class TodoRenderer extends PolymerElement {
  TodoDTO myTodo;
  bool editing = false;
  bool askConfirm = false;

  @Observe('askConfirm')
  void debugOpened(_) {
    print("Dialog open state has changed!");
  }

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
    //askConfirm = true;
    PaperDialog dlg = shadowRoot.querySelector('#dlg');
    dlg.open();
    //print("DIALOG : ${dlg} , ${dlg.opened}");
  }

  removeConfirmed(Event ev,details) {
    dispatchEvent(createCustomEvent('remove-me',myTodo));
  }
}
