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
    version = "1.0",
    deps = [
        "@polymer_element//:polymer_element",
        "@js//:js",
        "//todo_common",
        "//todo_main",
        "//todo_renderer",
        #'//todo_sample1'
    ],
)

bower(
    name = "main",
    resolutions = {
        "polymer": "2.0-preview",
    },
    deps = [
        "@polymer_element//:polymer_element",
        "@polymer_elements//:polymer_elements",
    ],
)

filegroup(
    name = "default",
    srcs = [
        "main",
        "todo_ddc",
    ],
)
