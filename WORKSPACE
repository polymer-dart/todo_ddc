# DEV MODE
local_repository(
 name='polymerize',
 #path='../devc_builder'
 path='../bazel_polymerize_rules'
)

# RELEASE
#git_repository(
# name='polymerize',
# tag='v_0_0_3',
# remote='https://github.com/dam0vm3nt/bazel_polymerize_rules')


load('@polymerize//:polymerize_workspace.bzl',
    'dart_library',
    'init_polymerize',
    'init_local_polymerize')

# RELEASE
#init_polymerize()

# DEV MODE
init_local_polymerize('/home/vittorio/Develop/dart/devc_builder')

dart_library(
  name='js',
  package_name='js',
  version='0.6.1')

dart_library(
  name='logging',
  package_name='logging',
  version='0.11.3+1')

dart_library(
  name='polymer_element',
  deps= ['@js//:js'],
  src_path='/home/vittorio/Develop/dart/polymer_element', # DEV MODE
#  pub_host = 'http://pub.drafintech.it:5001/api',
  package_name='polymer_element',
  version='0.1.0+1')
