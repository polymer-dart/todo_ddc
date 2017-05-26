import 'dart:convert';
import 'package:polymer_element/polymer_element.dart';
import 'package:js/js.dart';
import 'package:polymer_element/polymerize_js.dart';
import 'package:polymer_element/redux_local.dart';
import 'package:polymer_element/dart_callbacks_behavior.dart';
import 'package:built_collection/built_collection.dart';

int _id = 0;

class TodoDTO {
  int id = _id++;
  bool status;
  String text;

  TodoDTO({this.status: false, this.text});

  toJson() => {'status': status, 'text': text};
}

class ModelDTO {
  List<TodoDTO> todos = [];
}

ModelDTO model = new ModelDTO();

ModelDTO getModel() => model;

/**
 * The reducer
 */
myReducer(MyState state, ReduxAction action) {
  if (action.type == 'RESTORE_DATA') {
    if (action.detail != state.jsonData) {
      print("DECODING STATE FROM ${action.detail}");
      List<TodoDTO> todos = new List.from((JSON.decode(action.detail) as Iterable<Map>).map((x) => new TodoDTO(status: x['status'], text: x['text'])));
      return new MyState(todos: todos, jsonData: action.detail);
    } else {
      print("IGNORING STATE DECODEING BECAUSE data not changed");
      return state;
    }
  } else {
    List<TodoDTO> todos = _reduceTodos(state?.todos, action);
    String jsonData = JSON.encode(todos);
    print("NEW JSON DATA : ${jsonData}");
    return new MyState(todos: todos, jsonData: jsonData);
  }
}

typedef ListBuilder<TodoDTO> todoReducer(ReduxAction action,ListBuilder<TodoDTO> builder);

final Map<String,todoReducer> reducer = <String,todoReducer>{
  Actions.ADD_TODO : (ReduxAction addAction,listBuilder) => listBuilder
    ..add(addAction.detail),
  Actions.REMOVE_TODO: (ReduxAction remAction,listBuilder) => listBuilder
    ..removeAt(remAction.detail),
  Actions.UPDATE_TODO: (ReduxAction updateAction,listBuilder)  {
    ReduxAction<UpdateAt<TodoDTO>> a = updateAction;
    listBuilder[a.detail.pos]=a.detail.what;
    return listBuilder;
  }

};

/**
 * Todo list reducer
 */
List<TodoDTO> _reduceTodos(List<TodoDTO> todos, ReduxAction action) {
  ListBuilder<TodoDTO> listBuilder = new ListBuilder<TodoDTO>(todos??[]);

  todoReducer r = reducer[action.type];
  if (r==null) {
    return todos;
  }

  return new List.from(r(action,listBuilder).build());
}

/**
 * My generic state
 */
class MyState {
  /// a list of todos
  final List<TodoDTO> todos;
  final String jsonData;

  MyState({this.todos: const [], this.jsonData});
}

final globalStore = createStore(myReducer);

/**
 * Redux behavior associated to store `myStore`.
 * Implemented with a canonical behavior.
 */
@PolymerBehavior("TodoDDC.MyReduxBehavior")
abstract class MyReduxBehavior implements ReduxLocalBehavior, DartCallbacksBehavior {
  readyPostHook() {
    store = globalStore;
  }
}

class UpdateAt<X> {
  X what;
  int pos;

  UpdateAt(this.pos,this.what);
}

/**
 * Utility class with action factories.
 */
class Actions {
  static const String ADD_TODO = 'ADD_TODO';
  static const String REMOVE_TODO = 'REMOVE_TODO';
  static const String UPDATE_TODO = 'UPDATE_TODO';

  /**
   * Adds a todo to the list.
   */
  static ReduxAction<TodoDTO> createAddTodoAction(TodoDTO todo) => new ReduxAction(type: ADD_TODO, detail: todo);

  static ReduxAction createUpdateTodoAction(TodoDTO todo, int at) => new ReduxAction(type: UPDATE_TODO, detail: new UpdateAt<TodoDTO>(at,todo));
  /**
   * Removes a todo from the list
   */
  static ReduxAction<int> createRemoveTodoAction(int index) => new ReduxAction<int>(type: REMOVE_TODO, detail: index);
}
