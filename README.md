# trOS
trOS is a small [zig](https://ziglang.org) (and assembly) aarch64 RPI3 bare metal OS thingy.

some stuff that works:
* mailbox calls
* uart0
* framebuffer (initializing/clearing/printing characters and strings)
* gpio
* mmio

stuff that is being worked on:
* SD card support (read/write)
* (non-serial) Keyboard support
* USB
* networking
* anything else not mentioned above

# building
all you need to build is [zig](https://ziglang.org) itself. grab it and run:

```
zig build
```

the output file will be in `zig-cache`.

you can start a gdb remote server:

```
zig build qemu -Dgdb
```

if you want a very small binary: (NOTE this usually makes the kernel not functional; not recommended)

```
zig build -Drelease-fast
# or
zig build -Drelease-small
```

if you want release optimizations while still having safety checks:

```
zig build -Drelease-safe
```

# credit

thanks to [andrew kelly](https://github.com/andrewrk/clashos/) for the build file.

thanks to [bzt](https://github.com/bztsrc/raspi3-tutorial/blob/master/0B_readsector) for the emmc/sd card code.
