// how to compile this:
// zig build-obj -O ReleaseSmall -target thumb-freestanding-eabi -ofmt=elf src/main.zig
// dump:
// arm-none-eabi-objdump -d main.o > dis.txt

fn mytmain(myavar:u32,b:u32) callconv(.C) u32 {
    return myavar + b;
}

const call2_op = *const fn (value:u8,n:u32) void;


export fn mymemset() void {
	var memset: call2_op = @ptrFromInt(0x00ff00ff);
	memset(8,20);
}

var a: u32 = 0xdeadbeef;

fn mytest() callconv(.C) void {
	a = a + 1;
}

comptime {
@export(mytmain,.{.name="testmymain"});
//@export(a,.{.name="varia",.section=".text"});
@export(a,.{.name="varia"});
@export(mytest,.{.name="mytest"});
}