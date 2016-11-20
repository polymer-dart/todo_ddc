load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_common',
  deps=['@polymer_element//:polymer_element','@js//:js'],
  package_name = 'todo_common',
  version = '1.0',
  base_path="//todo_common:lib",
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**'],exclude=['lib/**/*.dart']))
