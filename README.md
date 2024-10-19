qemu-system-x86_64 -drive format=raw,file=bootloader.bin

nasm -f bin -o bootloader.bin bootloader.asm