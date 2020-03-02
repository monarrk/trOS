// Standard Input / Output

const framebuffer = @import("../vga/framebuffer.zig");
const uart = @import("../io/uart.zig");

pub fn print(msg: []const u8, args: var) void {
    uart.write(msg, args);
    framebuffer.write(msg, args);
}

pub fn println(msg: []const u8, args: var) void {
    uart.write(msg, args);
    uart.write("\n", .{});

    framebuffer.write(msg, args);
    framebuffer.write("\n", .{});
}
