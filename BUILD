load('@polymerize//:polymerize.bzl','polymer_library')

package(default_visibility=['//visibility:public'])

#polymer_library(
#  name = 'js',
#  dart_sources = ['@js//:js'],
#  package_name = 'js', #Cippa Lippa
#  version = '0.6.1')

#polymer_library(
#  name = 'polymer_element',
#  deps = ['//:js'],
#  dart_sources = ['@polymer_element//:polymer_element'],
#  package_name = 'polymer_element', #Cippa Lippa
#  version = '0.0.7')

polymer_library(
  name='todo_ddc',
  deps=[
    '@polymer_element//:library',
    '@js//:library',
    '//todo_common',
    '//todo_main',
    '//todo_renderer',
    '//todo_sample1'],
  package_name = 'todo_ddc',
  version = '1.0',
  base_path = '//:lib',
  dart_sources= glob(['lib/**/*.dart']),
  html_templates= glob(['lib/**'],exclude=['lib/**/*.dart']))
