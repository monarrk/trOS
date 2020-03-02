const builtin = @import("builtin");
const io = @import("io.zig");
const vga = @import("vga.zig");
const uart = io.uart;
const util = @import("util.zig");
const emmc = io.emmc;
const framebuffer = vga.framebuffer;
const int = @import("int.zig");
const stdio = @import("lib/stdio.zig");

const Version = util.Version;

pub fn panic(msg: []const u8, error_stack_trace: ?*builtin.StackTrace) noreturn {
    @setCold(true);
    uart.write("\nKERNEL PANIC: \n", .{});
    uart.write("MESSAGE: {}\n", .{msg});
    uart.write("STACK TRACE: {}\n", .{error_stack_trace});
    util.hang();
}

fn hangup() noreturn {
    util.powerOff();
    util.hang();
}

// From ClashOS
export fn shortExceptionHandlerAt0x1000() void {
    int.handler();
}

export fn kmain() noreturn {
    uart.init();
    emmc.SDHC.init() catch uart.write("Failed to init emmc", .{});

    uart.write("trOS v{}\r", .{Version});
    framebuffer.init().?;
    framebuffer.write("trOS v{}\r", .{Version});

    while (true) {
        const x = uart.get();
        uart.put(x);
        framebuffer.put(x);
    }

    // enter low power state and hang if we get somehow get out of the while loop.
    uart.write("Hanging up system\n", .{});
    hangup();
}
