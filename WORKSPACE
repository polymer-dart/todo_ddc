# Polymerize rules repository

local_repository(
 name='polymerize',
 path='/home/vittorio/Develop/dart/bazel_polymerize_rules'
)

# Load Polymerize rules
load('@polymerize//:polymerize_workspace.bzl',
    'dart_library',
    'init_local_polymerize')

# Init
init_local_polymerize('/home/vittorio/Develop/dart/polymerize')


##
## All the dart libraries we depend on
##

dart_library(
  name='logging',
  deps= [],
  package_name='logging',
  pub_host = 'http://pub.drafintech.it:5001/api',
  version='0.11.3+1')


dart_library(
  name='polymer_element',
  deps= ["@js//:js"],
  src_path='/home/vittorio/Develop/dart/polymer_element',
  #pub_host = 'http://pub.drafintech.it:5001/api',
  package_name='polymer_element',
  version='0.3.0')


dart_library(
  name='js',
  deps= [],
  package_name='js',
  pub_host = 'http://pub.drafintech.it:5001/api',
  version='0.6.1')


dart_library(
  name='polymer_elements',
  deps= ["@js//:js","@polymer_element//:polymer_element"],
  src_path='/home/vittorio/Develop/dart/polymer_elements',
  #pub_host = 'http://pub.drafintech.it:5001/api',
  package_name='polymer_elements',
  version='2.0.0-preview.0')


