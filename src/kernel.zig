const builtin = @import("builtin");
const io = @import("io.zig");
const vga = @import("vga.zig");
const uart = io.uart;
const util = @import("util.zig");
const emmc = io.emmc;
const framebuffer = vga.framebuffer;

const Version = util.Version;

// TODO(sam): Take in new boot images from the serial port for easier real hardware testing.

// TODO(sam): Parse input from UART0 and handle commands. Should just be able to
// read into a buffer, track the index, slice up to it (buffer[0..idx]) and
// take that as a []const u8 for matching as a command.

// TODO(sam): Re-do docs.

pub fn panic(msg: []const u8, error_stack_trace: ?*builtin.StackTrace) noreturn {
    @setCold(true);
    uart.write("\nKERNEL PANIC: \n", .{});
    uart.write("MESSAGE: {}\n", .{msg});
    uart.write("STACK TRACE: {}\n", .{error_stack_trace});
    util.hang();
}

export fn kmain() noreturn {
    uart.init();
    uart.write("trOS v{}\r", .{Version});
    framebuffer.init().?;
    framebuffer.write("trOS v{}\r", .{Version});
    while (true) {
        const x = uart.get();
        uart.put(x);
        framebuffer.put(x);
    }
    // enter low power state and hang if we get somehow get out of the while loop.
    util.powerOff();
    util.hang();
}
