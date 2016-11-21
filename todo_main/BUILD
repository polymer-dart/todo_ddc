load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_main',
  deps=[
    '@polymer_element//:polymer_element',
    '@js//:js',
    '//todo_common',
    '//todo_renderer'],
  package_name = 'todo_main',
  version = '1.0',
  base_path= '//todo_main:lib',
  #asset_output =  ['todo_main.html'],
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**'],exclude=['lib/**/*.dart']))
