import 'package:html5/html.dart';
import 'package:polymerize_common/init.dart';
import 'package:todo_main/todo_main.dart';
import 'package:polymer_elements/web_animations_js.dart';
import 'package:polymer_elements/platinum_sw_register.dart';
import 'package:polymer_elements/platinum_sw_cache.dart';
import 'package:polymer_elements/iron_flex_layout.dart';

@init
main() {
 print("hello here we are!!");
 (window.document.querySelector('#reg') as PlatinumSwRegister).register();
}
