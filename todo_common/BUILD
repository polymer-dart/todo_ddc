load("@polymerize//:polymerize.bzl", "polymer_library")

package(default_visibility = ["//visibility:public"])

polymer_library(
    name = "todo_common",
    package_name = "todo_common",
    base_path = "//todo_common:lib",
    dart_sources = glob(["lib/**/*.dart"]),
    html_templates = glob(
        ["lib/**"],
        exclude = ["lib/**/*.dart"],
    ),
    version = "1.0",
    deps = [
        "@logging//:logging","@js//:js","@polymer_element//:polymer_element"
    ],
)
