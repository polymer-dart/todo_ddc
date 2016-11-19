local_repository(
 name='polymerize',
 path='../bazel_polymerize_rules'
)

load('@polymerize//:polymerize.bzl','dart_library')

dart_library(
  name='js',
  package_name='js',
  version='0.6.1'
  )

dart_library(
  name='logging',
  package_name='logging',
  version='0.11.3+1'
  )

dart_library(
  name='polymer_element',
  deps= ['@js//:library'],
  package_name='polymer_element',
  version='0.0.7'
  )
