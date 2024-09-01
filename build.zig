const std = @import("std");

pub fn build(b: *std.Build) void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var arena = std.heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit(); // release arena
    const alloc = arena.allocator();

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "spindle-zig",
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);

    const exe = b.addExecutable(.{
        .name = "spindle-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.addIncludePath(b.path("cpp/"));
    exe.addIncludePath(b.path("google-cloud-cpp/"));
    exe.addIncludePath(b.path("google-cloud-cpp/out/external/googleapis/"));
    exe.addIncludePath(b.path("google-cloud-cpp/out/google/cloud/spanner/"));
    exe.addIncludePath(b.path("google-cloud-cpp/out/vcpkg_installed/x64-linux/include/"));
    exe.addCSourceFiles(.{
        .root = b.path("cpp/"),
        .files = &.{"bindings.cpp"},
    });

    const dirs = [_][]const u8{
        "google-cloud-cpp/out/google/cloud",
        "google-cloud-cpp/out/google/cloud/spanner",
        "google-cloud-cpp/out/external/googleapis",
        "google-cloud-cpp/out/vcpkg_installed/x64-linux/lib",
    };

    for (dirs) |d| {
        var children = std.fs.cwd().openDir(d, .{ .iterate = true }) catch return;
        defer children.close();
        var iter = children.iterate();
        while (true) {
            const item = iter.next() catch return;
            if (item) |v| {
                const bench = std.mem.eql(u8, v.name, "libbenchmark_main.a");
                const ext = std.fs.path.extension(v.name);
                if (std.mem.eql(u8, ext, ".a") and !bench) {
                    const full = std.fmt.allocPrint(alloc, "{s}/{s}", .{ d, v.name }) catch return;
                    exe.addObjectFile(b.path(full));
                }
            } else break;
        }
    }

    exe.linkLibCpp();
    // exe.linkLibC();
    // exe.linkSystemLibrary("c++");

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .filter = b.option([]const u8, "test-filter", "Filter strings for test"),
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
