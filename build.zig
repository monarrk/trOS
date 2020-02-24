const builtin = @import("builtin");
const std = @import("std");
const Builder = std.build.Builder;
const Target = std.Target;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("trOS", "src/kernel.zig");
    exe.addAssemblyFile("src/asm/boot.S");
    exe.addAssemblyFile("src/asm/vector.S");
    exe.setBuildMode(mode);

    exe.setLinkerScriptPath("./sys/linker.ld");
    exe.setTheTarget(Target.parse( .{ 
        .arch_os_abi = "aarch64-freestanding-eabihf", 
        .cpu_features = "generic+v8a"
    }) catch { 
        std.debug.warn("Failed to set target!\n", .{});
        return;
     });

    exe.install();

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
