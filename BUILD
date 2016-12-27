load("@polymerize//:polymerize.bzl", "polymer_library", "bower")

package(default_visibility = ["//visibility:public"])

polymer_library(
    name = "todo_ddc",
    package_name = "todo_ddc",
    base_path = "//:lib",
    dart_sources = glob(["lib/**/*.dart"]),
    export_sdk = 1,
    html_templates = glob(
        [
            "lib/**",
            "web/**",
        ],
        exclude = ["**/*.dart"],
    ),
    version = "0.0.1",
    deps = [
        "@logging//:logging","@js//:js","@polymer_element//:polymer_element","//todo_common","@polymer_elements//:polymer_elements","//todo_renderer","//todo_main"
    ],
)


# TODO : IMPLEMENT THIS AS AN ASPECT
bower(
    name = "main",
    resolutions = {
        "polymer": "2.0-preview",
    },
    deps = [
    ":todo_ddc",
         "@logging//:logging",
         "@polymer_element//:polymer_element",
         "@js//:js",
         "//todo_main",
         "//todo_renderer",
         "//todo_common",
         "@polymer_elements//:polymer_elements"
    ],
)

filegroup(
    name = "default",
    srcs = [
        "main",
        "todo_ddc",
    ],
)
