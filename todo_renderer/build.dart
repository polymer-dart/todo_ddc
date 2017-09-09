import 'package:build_runner/build_runner.dart';
import 'package:source_gen/source_gen.dart';
import 'package:polymerize/polymerize.dart';

main() {
  build([
    new BuildAction(polymerizePartBuilder(), 'todo_renderer',inputs:['lib/**.dart','web/**.dart']),
  ]);
}
