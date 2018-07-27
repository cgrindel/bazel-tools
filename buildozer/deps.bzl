load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def buildozer_dependencies():
    _maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "b5f6abe419da897b7901f90cbab08af958b97a8f3575b0d3dd062ac7ce78541f",
        strip_prefix = "bazel-skylib-0.5.0",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/0.5.0.tar.gz"],
    )

    # used for build.proto for buildozer :tableflip: https://github.com/bazelbuild/buildtools/issues/143
    _maybe(
        http_archive,
        name = "io_bazel",
        sha256 = "a0333e7e8ce885f85f52bbb239e36810ac340c211c550d10c499f098a2e925a8",
        strip_prefix = "bazel-0.15.2",
        urls = [
            "http://mirror.bazel.build/github.com/bazelbuild/bazel/archive/0.15.2.tar.gz",
            "https://github.com/bazelbuild/bazel/archive/0.15.2.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        sha256 = "2f8df5baab5ed7d7aaa4c73a7789e468b675c344312cb03c3d9b677563cac535",
        strip_prefix = "buildtools-c39a197f7d35aebb0e0b031d728fb918f73887d6",
        urls = ["https://github.com/bazelbuild/buildtools/archive/c39a197f7d35aebb0e0b031d728fb918f73887d6.tar.gz"],
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
