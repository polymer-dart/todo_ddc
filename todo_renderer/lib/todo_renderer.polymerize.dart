// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// Generator: PolymerizeDartGenerator
// **************************************************************************

part of 'package:todo_renderer/todo_renderer.dart';

@initModule
generatedInitModule() {
  register(
      TodoRenderer,
      'todo-renderer',
      new Config(
          observers: [
            'updateState(myTodo)',
            'notifyState(todo)',
            'debugOpened(askConfirm)'
          ],
          properties: jsify({
            'myTodo': new PolymerProperty(notify: false, computed: null),
            'todo': new ReduxProperty(notify: false, statePath: 'todo'),
            'editing': new ReduxProperty(notify: false, statePath: 'editing'),
            'askConfirm': new PolymerProperty(notify: false, computed: null),
            'textField': new PolymerProperty(notify: false, computed: null),
            'statusCheckbox': new PolymerProperty(notify: false, computed: null)
          }),
          reduxActions: [],
          behaviors: [resolveJsObject('PolymerReduxLocal')]),
      summary(),
      false,
      'todo_renderer.html');
  return;
}

final FORCE_asset_todo_renderer_lib_todo_renderer_dart = false ||
    FORCE_asset_html5_lib_html_dart ||
    FORCE_asset_polymer_element_lib_polymerize_js_dart ||
    FORCE_asset_todo_common_lib_model_dart ||
    FORCE_asset_polymer_element_lib_polymer_element_dart ||
    FORCE_asset_polymer_elements_lib_paper_dialog_dart ||
    FORCE_asset_polymer_elements_lib_paper_checkbox_dart ||
    FORCE_asset_polymer_elements_lib_paper_icon_button_dart ||
    FORCE_asset_polymer_elements_lib_iron_icon_dart ||
    FORCE_asset_polymer_elements_lib_iron_icons_dart ||
    FORCE_asset_polymer_elements_lib_paper_material_dart ||
    FORCE_asset_polymer_elements_lib_paper_input_dart ||
    FORCE_asset_polymer_elements_lib_iron_flex_layout_dart ||
    FORCE_asset_polymer_element_lib_redux_local_dart;

