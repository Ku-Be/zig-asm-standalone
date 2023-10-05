const std = @import("std");
const uf2 = @import("deps/uf2/build.zig");

pub fn build(b: *std.Build) !void {
    var target = try std.zig.CrossTarget.parse(.{ .arch_os_abi = "arm-freestanding-eabi" });
    target.cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus };

    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "test.elf",
        .root_source_file = undefined,
        .target = target,
        .optimize = optimize,
    });
    exe.addAssemblyFile(.{ .path = "src/ramboot.s" });
    exe.setLinkerScript(.{ .path = "src/link.ld" });
    b.installArtifact(exe);

    const uf2_dep = b.anonymousDependency("deps/uf2", uf2, .{});
    //const uf2_dep = b.dependency("uf2",.{}); not using the package manager, so this does not work.
    const uf2_file = uf2.from_elf(uf2_dep, exe, .{ .family_id = .RP2040 });
    const uf2_install = b.addInstallFile(uf2_file, "bin/test.uf2");
    b.getInstallStep().dependOn(&uf2_install.step);
}
