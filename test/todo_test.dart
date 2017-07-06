@TestOn('chrome')
library mytest;

import 'package:html5/html.dart' ;
import 'package:polymer_element/polymer_element.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'package:todo_main/todo_main.dart';

@entryPoint
void main() {
  group('test.framework.works', () {
    test('simple test', () {
      print('ok then');
    });
    test("simple async test", () async {
      var value = await new Future.value(10);
      print('Hi man! : ${value}');
      expect(value, equals(10));
    });
  });

  group('some more usefull tests',() {
    test('creating and using polymerize component',() async {
      TodoMain main = document.createElement('todo-main');
      body.appendChild(main);
      await new Future(()=>0);
      main.newText = 'some text';
      await new Future(()=>0);
      assert(main.canAdd,'can add is true');
      main.addTodo(null, null);
      await new Future(()=>0);
      assert(main.todos.isNotEmpty,'something happened');
      assert(main.todos[0].text=='some text','text is right');
    });
  });
}
