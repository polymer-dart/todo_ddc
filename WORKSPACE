local_repository(
 name='polymerize',
 path='../bazel_polymerize_rules'
)

load('@polymerize//:polymerize.bzl','dart_library')

dart_library(
  name='js',
  packageName='js'
  )

dart_library(
  name='logging',
  deps=['@js//:library'],
  packageName='logging'
  )
