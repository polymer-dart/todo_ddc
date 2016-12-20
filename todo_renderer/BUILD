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
        "@js//:js",
        "@polymer_element//:polymer_element",
        "@polymer_elements//:polymer_elements",
        "//todo_common",
    ],
)
