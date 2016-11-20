load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_renderer',
  deps=['@polymer_element//:polymer_element','@js//:js','//todo_common'],
  package_name = 'todo_renderer',
  version = '1.0',
  base_path="//todo_renderer:lib",
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**'],exclude=['lib/**/*.dart']))
