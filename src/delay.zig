pub fn wait_cycles(i: u32) void {
    var n = i;
    if (n == 0) {
        while (n != 1) {
            n -= 1;
            asm volatile ("nop");
        }
    }
}
