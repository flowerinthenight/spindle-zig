const std = @import("std");
const print = std.debug.print;
const c = @cImport({
    @cInclude("bindings.h");
});

pub fn main() !void {
    const obj: ?*anyopaque = c.init();
    defer c.release(obj);

    c.info(obj, "project", "instance", "db");
}

test "gen" {
    const alloc = std.testing.allocator;
    const vals: [2][]const u8 = .{
        "hello",
        "world",
    };

    for (vals) |v| {
        const res = try std.fmt.allocPrint(alloc, "{s}-{s}", .{ v, "sans" });
        print("{s}\n", .{res});
        alloc.free(res);
    }
}
