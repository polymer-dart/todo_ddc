load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_common',
  deps=['@polymer_element//:library','@js//:library'],
  package_name = 'todo_common',
  version = '1.0',
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**/*.html']))
