# zig-asm-standalone
Testing how to use zig build-exe to make executable code for booting rp2040 from ram.
At the moment the generated binary has vma and lma of .text section set to 0, even though they are specified in the linker script.
Trying to figure out how this works.

