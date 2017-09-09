// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// Generator: PolymerizeDartGenerator
// **************************************************************************

part of 'package:todo_main/todo_main.dart';

@initModule
generatedInitModule() {
  defineBehavior(
      'Sample.MyBehavior',
      MyBehavior,
      new Config(
          observers: ['checkObserveOnBehavior(myProp)'],
          properties: jsify(
              {'myProp': new PolymerProperty(notify: false, computed: null)}),
          reduxActions: [],
          behaviors: [resolveJsObject('Polymerize.DartCallbacksBehavior')]));
  register(
      MyTestComp,
      'test-comp',
      new Config(
          observers: [],
          properties: jsify(
              {'template': new PolymerProperty(notify: false, computed: null)}),
          reduxActions: [],
          behaviors: [resolveJsObject('Sample.MyBehavior')]),
      summary(),
      false,
      null);
  register(
      TodoMain,
      'todo-main',
      new Config(
          observers: ['restoreJson(jsonData)', 'checkLen(newText)'],
          properties: jsify({
            'newText': new PolymerProperty(notify: false, computed: null),
            'todos': new ReduxProperty(notify: false, statePath: 'todos'),
            'todos2': new PolymerProperty(notify: false, computed: null),
            'canAdd': new PolymerProperty(notify: false, computed: null),
            'jsonData': new ReduxProperty(notify: false, statePath: 'jsonData'),
            'rpt': new PolymerProperty(notify: false, computed: null)
          }),
          reduxActions: [],
          behaviors: [
            resolveJsObject('TodoDDC.MyReduxBehavior'),
            resolveJsObject('Polymer.MutableData'),
            resolveJsObject('Polymer.IronValidatableBehavior')
          ]),
      summary(),
      false,
      'todo_main.html');
  return;
}

final FORCE_asset_todo_main_lib_todo_main_dart = false ||
    FORCE_asset_html5_lib_html_dart ||
    FORCE_asset_polymer_element_lib_redux_local_dart ||
    FORCE_asset_polymer_elements_lib_iron_flex_layout_dart ||
    FORCE_asset_polymer_elements_lib_iron_icon_dart ||
    FORCE_asset_polymer_elements_lib_iron_icons_dart ||
    FORCE_asset_polymer_element_lib_polymer_element_dart ||
    FORCE_asset_todo_common_lib_model_dart ||
    FORCE_asset_todo_renderer_lib_todo_renderer_dart ||
    FORCE_asset_polymer_elements_lib_paper_input_dart ||
    FORCE_asset_polymer_elements_lib_paper_icon_button_dart ||
    FORCE_asset_polymer_elements_lib_paper_button_dart ||
    FORCE_asset_polymer_elements_lib_iron_validatable_behavior_dart ||
    FORCE_asset_polymer_element_lib_super_dart ||
    FORCE_asset_polymer_elements_lib_iron_meta_dart ||
    FORCE_asset_polymer_elements_lib_app_localstorage_document_dart ||
    FORCE_asset_polymer_elements_lib_app_header_layout_dart ||
    FORCE_asset_polymer_elements_lib_app_header_dart ||
    FORCE_asset_polymer_elements_lib_app_toolbar_dart ||
    FORCE_asset_polymer_elements_lib_app_scroll_effects_dart ||
    FORCE_asset_polymer_element_lib_observe_dart ||
    FORCE_asset_todo_main_lib_todo_list_dart;

