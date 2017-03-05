@JS()
library model;

import 'package:polymer_element/polymer_element.dart';
import 'package:js/js.dart';

int _id = 0;

class TodoDTO {
  int id = _id++;
  bool status;
  String text;

  TodoDTO({this.status: false, this.text});
}

class ModelDTO {
  List<TodoDTO> todos = [];
}

ModelDTO model = new ModelDTO();

ModelDTO getModel() => model;

myReducer(MyState state, ReduxAction action) =>
    new MyState(todos: reduceTodos(state?.todos, action));

List<TodoDTO> reduceTodos(List<TodoDTO> todos, ReduxAction action) {
  switch (action.type) {
    case Actions.ADD_TODO:
      return new List()
        ..addAll(todos ?? [])
        ..add((action as AddTodoAction).todo);
    case Actions.REMOVE_TODO:
      return new List()
        ..addAll(todos ?? [])
        ..removeAt((action as RemoveTodoAction).index);
    default:
      return todos;
  }
}

const StoreDef myStore = const StoreDef(myReducer);

class MyState {
  List<TodoDTO> todos;

  MyState({this.todos: const []});
}

@myStore
class MyReduxBehavior extends ReduxBehavior {}

class Actions {
  static const String ADD_TODO = 'ADD_TODO';
  static const String REMOVE_TODO = 'REMOVE_TODO';

  static AddTodoAction createAddTodoAction(TodoDTO todo) =>
      new AddTodoAction(type: ADD_TODO, todo: todo);
  static RemoveTodoAction createRemoveTodoAction(int index) =>
      new RemoveTodoAction(type: REMOVE_TODO, index: index);
}

@JS()
@anonymous
class AddTodoAction extends ReduxAction {
  external TodoDTO get todo;
  external factory AddTodoAction({String type, TodoDTO todo});
}

@JS()
@anonymous
class RemoveTodoAction extends ReduxAction {
  external int get index;
  external factory RemoveTodoAction({String type, int index});
}
