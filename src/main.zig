const std = @import("std");
const dbg = std.debug.print;
const log = std.log;
// const c = @cImport({
//     @cInclude("bindings.h");
// });

extern fn add(a: c_int, b: c_int) c_int;

pub fn main() !void {
    // const obj: ?*anyopaque = c.init();
    // defer c.release(obj);

    // c.info(obj, "z-project", "z-instance", "z-db");

    log.info("add: {d}", .{add(1, 2)});
}

test "gen" {
    const alloc = std.testing.allocator;
    const vals: [2][]const u8 = .{
        "hello",
        "world",
    };

    for (vals) |v| {
        const res = try std.fmt.allocPrint(alloc, "{s}-{s}", .{ v, "sans" });
        dbg("{s}\n", .{res});
        alloc.free(res);
    }
}
