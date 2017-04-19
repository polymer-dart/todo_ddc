load("@polymerize//:polymerize.bzl", "polymer_library")

package(default_visibility = ["//visibility:public"])

polymer_library(
    name = "todo_renderer",
    package_name = "todo_renderer",
    base_path = "//todo_renderer:lib",
    dart_sources = glob(["lib/**/*.dart"]),
    html_templates = glob(
        ["lib/**"],
        exclude = ["lib/**/*.dart"],
    ),
    version = "1.0",
    deps = [
        "@logging//:logging","@js//:js","@html5//:html5","@polymer_element//:polymer_element","//todo_common","@polymer_elements//:polymer_elements"
    ],
)
