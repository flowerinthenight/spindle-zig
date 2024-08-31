const std = @import("std");
const print = std.debug.print;
const c = @cImport({
    @cInclude("bindings.h");
});

pub fn main() !void {
    const obj: ?*anyopaque = c.init();
    defer c.release(obj);

    c.hello(obj);
}
