import 'package:html5/html.dart';

import 'package:polymer_element/polymerize_js.dart';
import 'package:todo_common/model.dart';
import 'package:polymer_element/polymer_element.dart';
import 'package:polymer_elements/paper_dialog.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_element/redux_local.dart';

import 'dart:async';

class RendererState {
  final TodoDTO todo;
  final bool editing;

  RendererState(this.todo, this.editing);
}

RendererState _updateRendererState(RendererState oldState, ReduxAction action) =>
    new RendererState(_updateTodoDTO(oldState?.todo, action), _updateEditing(oldState?.editing, action));

TodoDTO _updateTodoDTO(TodoDTO oldTodo, ReduxAction action) {
  switch (action.type) {
    case 'UPDATE_TODO_TEXT':
      return new TodoDTO(status: oldTodo?.status, text: action.detail);
    case 'UPDATE_TODO_STATUS':
      return new TodoDTO(status: action.detail, text: oldTodo?.text);
    case 'INIT_STATE':
      return action.detail;
  }
  return oldTodo;
}

bool _updateEditing(bool oldEditing, ReduxAction action) {
  switch (action.type) {
    case 'UPDATE_EDITING':
      return action.detail;
    case 'INIT_STATE':
      return false;
  }

  return oldEditing;
}

/**
 * Renderer element
 */
@PolymerRegister('todo-renderer',
    template: 'todo_renderer.html', uses: const [PaperCheckbox, PaperIconButton, IronIcon, IronIcons, PaperMaterial, PaperInput, IronFlexLayout, PaperDialog])
abstract class TodoRenderer extends PolymerElement implements ReduxLocalBehavior {
  TodoDTO myTodo;

  @Observe('myTodo')
  void updateState() {
    print("My todo changed : ${myTodo} , ${todo} , dispatching : ${myTodo!=todo}");
    if (myTodo != todo) dispatch(initState(myTodo));
  }

  @Property(statePath: 'todo')
  TodoDTO todo;
  @Property(statePath: 'editing')
  bool editing;
  bool askConfirm;

  @Observe('todo')
  void notifyState() {
    print("Local todo changed ${todo} , ${myTodo}, notifying :${todo!=myTodo}");
    if (myTodo != todo) {
      dispatchEvent(new CustomEvent('my-todo-changed', new CustomEventInit()..detail = {'old': myTodo, 'new': todo}));
    }
  }

  @Observe('askConfirm')
  void debugOpened(_) {
    print("Dialog open state has changed!");
  }

  static ReduxAction<TodoDTO> initState(TodoDTO newText) => new ReduxAction<TodoDTO>(type: 'INIT_STATE', detail: newText);

  static ReduxAction<String> updateTodoText(String newText) => new ReduxAction<String>(type: 'UPDATE_TODO_TEXT', detail: newText);

  static ReduxAction<bool> updateTodoStatus(bool newStatus) => new ReduxAction<bool>(type: 'UPDATE_TODO_STATUS', detail: newStatus);

  static ReduxAction<bool> changeEditing(bool editing) => new ReduxAction<bool>(type: 'UPDATE_EDITING', detail: editing);

  startEdit(Event ev, details) => dispatch(changeEditing(true));

  finishEdit(Event ev, details) => dispatch(changeEditing(false));

  TodoRenderer() {
    askConfirm = false;
    store = createStore(_updateRendererState);
  }

  PaperInput get textField => this.shadowRoot.querySelector('#textField');
  PaperCheckbox get statusCheckbox => this.shadowRoot.querySelector('#statusCheckbox');

  void textChanged() => dispatch(updateTodoText(textField.value));

  void statusChanged() => dispatch(updateTodoStatus(statusCheckbox.checked));

  domChanged1(Event ev, details) {
    if (editing) {
      new Future(() {

        HTMLInputElement iee = textField.shadowRoot.querySelector('input');
        iee.setSelectionRange(0, myTodo.text.length);
        iee.focus();
      });
    }
  }

  removeMe(Event ev, details) {
    //askConfirm = true;
    PaperDialog dlg = shadowRoot.querySelector('#dlg');
    dlg.opened = true;
    print("DIALOG : ${dlg} , ${dlg.opened}");
  }

  removeConfirmed(Event ev, details) {
    dispatchEvent(createCustomEvent('remove-me', myTodo));
  }
}
