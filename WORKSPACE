# Polymerize rules repository
git_repository(
 name='polymerize',
 tag='v_0_0_5',
 remote='https://github.com/dam0vm3nt/bazel_polymerize_rules')

# Load Polymerize rules
load('@polymerize//:polymerize_workspace.bzl',
    'dart_library',
    'init_polymerize')

# Init
init_polymerize()


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
  package_name='polymer_element',
  pub_host = 'http://pub.drafintech.it:5001/api',
  version='0.2.0')


dart_library(
  name='js',
  deps= [],
  package_name='js',
  pub_host = 'http://pub.drafintech.it:5001/api',
  version='0.6.1')


git_repository(
    name = "polymer_elements",
    remote = "https://github.com/dam0vm3nt/polymerize_elements.git",
    tag = "v0.1.0",
)


