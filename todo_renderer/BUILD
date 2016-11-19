load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_renderer',
  deps=['@polymer_element//:library','@js//:library','//todo_common'],
  package_name = 'todo_renderer',
  version = '1.0',
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**/*.html']))
