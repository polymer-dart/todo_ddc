load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_sample1',
  deps=['@polymer_element//:library','@js//:library','//todo_common'],
  package_name = 'todo_sample1',
  version = '1.0',
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**/*.html']))
