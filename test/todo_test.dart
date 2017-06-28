//@TestOn('chrome')
//library mytest;

import 'package:test/test.dart';
import 'dart:async';

void main() {
  test('this will work', () {
    print('ok then');
  });
  test("new Future.value() returns the value", () async {
    var value = await new Future.value(10);
    print('Hi man! : ${value}');
    expect(value, equals(10));
  });
}
