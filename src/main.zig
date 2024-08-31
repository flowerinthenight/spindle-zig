const std = @import("std");
const print = std.debug.print;
const c = @cImport({
    @cInclude("bindings.h");
});

pub fn main() !void {
    const v = c.hellocpp(2);
    print("ret={any}\n", .{v});

    // const ptr: anyopaque = c.init();
    // c.release(ptr);
}
