import 'dart:html';
import 'package:polymer_element/polymer_element.dart';

@Define(tagName:'my-comp',htmlFile:'my-comp.html')
class MyComp extends HtmlElement {
  MyComp() : super.created() {
    print("Created callback");
    this.innerHtml="<div>Hello Web Comp v.1.0!</div>";
  }

  void connectedCallback() {
    print("Connected!");
  }
}
