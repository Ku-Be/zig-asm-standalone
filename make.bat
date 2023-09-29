zig build-exe -ofmt=elf -target thumb-freestanding-eabi -mcpu cortex_m0plus -O ReleaseSmall --script link.ld ramboot.s
arm-none-eabi-objdump -D ramboot > dis2.txt
