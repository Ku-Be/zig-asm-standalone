# zig-asm-standalone

Testing how to use zig to generate code for the rp2040.
It can now boot from ram into a minimal blinky program, written in assembly language, by Matt Jacobson:
https://github.com/mhjacobson/pico-blink-asm

For now, while the zig package manager does not support local packages, I will not use it.
Rather, dependencies will be placed into this tree and added as anonymousDependency in build.zig.

The deps directory contains https://github.com/ZigEmbeddedGroup/uf2 .
The import in build.zig looks like this: `const uf2 = @import("deps/uf2/build.zig");`
Git submodules can be used for that, but I do not know how those work, so I will add the files manually for now.

In the beginning the elf2uf2 python program by doug summerville https://github.com/dougsummerville/elf2uf2 was used to generate uf2 files.
Now the uf2 program by ZigEmbeddedGroup is used, as it integrates nicely with the build system.

However, at the moment, this does not work.
elf2uf2.exe fails with an error "missing arg: --output-path".
This might be because the output path is directly concatenated onto the flag without a space:

```C:\wdir\zig_micro\zig-asm-standalone\zig-cache\o\a436d06b8e3b94bd4ab1aa1490293233\elf2uf2.exe --family-id RP2040 --elf-path C:\wdir\zig_micro\zig-asm-standalone\zig-cache\o\e45486fe662c1db6d691d4bba282ba05\test.elf --output-pathC:\wdir\zig_micro\zig-asm-standalone\zig-cache\o\79b1fff4b94b645ab40cadf92d1f4ef0\test.uf2```


