import 'dart:html';

import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:polymer_element/paper_dialog.dart';
import 'package:polymer_element/paper_checkbox.dart';
import 'package:polymer_element/paper_icon_button.dart';
import 'package:polymer_element/iron_icon.dart';
import 'package:polymer_element/iron_icons.dart';
import 'package:polymer_element/paper_material.dart';
import 'package:polymer_element/paper_input.dart';
import 'package:polymer_element/iron_flex_layout.dart';

import 'dart:async';

@PolymerRegister('todo-renderer', template: 'todo_renderer.html',uses:const [
  PaperCheckbox,
  PaperIconButton,
  IronIcon,
  IronIcons,
  PaperMaterial,
  PaperInput,
  IronFlexLayout,
  PaperDialog])
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
        PaperInput in0 = this.shadowRoot.querySelector("paper-input");

        InputElement iee = in0.shadowRoot.querySelector('input');
        iee.setSelectionRange(0, myTodo.text.length);
        iee.focus();
      });
    }
  }

  removeMe(Event ev,details) {
    //askConfirm = true;
    PaperDialog dlg = shadowRoot.querySelector('#dlg');
    dlg.open();
    print("DIALOG : ${dlg} , ${dlg.opened}");
  }

  removeConfirmed(Event ev,details) {
    dispatchEvent(createCustomEvent('remove-me',myTodo));
  }
}
