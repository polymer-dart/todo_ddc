#For dev
local_repository(
 name='polymerize',
 #path='../devc_builder'
 path='../bazel_polymerize_rules'
)

#git_repository(
#  name='dart',
#  remote='https://github.com/dart-lang/rules_dart',
#  commit='70c6ad4f32d26edbacb957d3c1c0f9d04b88fc95')

  

#git_repository(
# name='polymerize',
# tag='v_0_0_2',
# remote='https://github.com/dam0vm3nt/bazel_polymerize_rules')

load('@polymerize//:polymerize.bzl','dart_library','dart_pub')

dart_pub(
  name='dartpub',
  pub_host = 'http://pub.drafintech.it:5001/api')

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
#  src_path='/home/vittorio/Develop/dart/polymer_element',
  pub_host = 'http://pub.drafintech.it:5001/api',
  package_name='polymer_element',
  version='0.1.0-rc.1')
