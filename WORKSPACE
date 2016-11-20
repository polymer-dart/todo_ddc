local_repository(
 name='polymerize',
 path='../bazel_polymerize_rules'
)

load('@polymerize//:polymerize.bzl','dart_library')

dart_library(
  name='js',
  package_name='js',
  src_path='/home/vittorio/.pub-cache/hosted/http%58%47%47pub.drafintech.it%585001/js-0.6.1',
  version='0.6.1'
  )

dart_library(
  name='logging',
  package_name='logging',
  src_path='/home/vittorio/.pub-cache/hosted/http%58%47%47pub.drafintech.it%585001/logging-0.11.3+1',
  version='0.11.3+1'
  )

dart_library(
  name='polymer_element',
  deps= ['@js//:library'],
  src_path='/home/vittorio/Develop/dart/polymer_element',
  package_name='polymer_element',
  version='0.0.7'
  )
