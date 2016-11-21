load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

polymer_library(
  name='todo_ddc',
  deps=[
    '@polymer_element//:polymer_element',
    '@js//:js',
    '//todo_common',
    '//todo_main',
    '//todo_renderer',
    #'//todo_sample1'
  ],
  package_name = 'todo_ddc',
  version = '1.0',
  export_sdk = 1,
  base_path = '//:lib',
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**','web/**'],exclude=['**/*.dart']))


filegroup(
  name='default',
  srcs=['todo_ddc'])
