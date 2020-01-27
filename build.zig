const builtin = @import("builtin");
const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const want_gdb = b.option(bool, "gdb", "Build for QEMU gdb server") orelse false;
    const want_pty = b.option(bool, "pty", "Create a separate serial port path") orelse false;

    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("trOS", "src/kernel.zig");
    exe.addAssemblyFile("src/asm/boot.S");
    exe.setBuildMode(mode);

    exe.setLinkerScriptPath("./linker.ld");
    // Use eabihf for freestanding arm code with hardware float support
    exe.setTarget(builtin.Arch{ .aarch64 = builtin.Arch.Arm64.v8_5a }, builtin.Os.freestanding, builtin.Abi.eabihf);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
