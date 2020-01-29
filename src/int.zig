/// Interrupts
const uart = @import("io.zig").uart;

pub const IRQ_BASIC: u32 = 0x2000B200;
pub const IRQ_PEND1: u32 = 0x2000B204;
pub const IRQ_PEND2: u32 = 0x2000B208;
pub const IRQ_FIQ_CONTROL: u32 = 0x2000B210;
pub const IRQ_ENABLE_BASIC: u32 = 0x2000B218;
pub const IRQ_DISABLE_BASIC: u32 = 0x2000B224;

// Stolen from ClashOS interrupt code
pub fn handler() void {
    uart.write("Arm exception recieved\n", .{});
    var current_el = asm ("mrs %[current_el], CurrentEL"
        : [current_el] "=r" (-> usize)
    );
    var esr_el3 = asm ("mrs %[esr_el3], esr_el3"
        : [esr_el3] "=r" (-> usize)
    );
    var elr_el3 = asm ("mrs %[elr_el3], elr_el3"
        : [elr_el3] "=r" (-> usize)
    );
    var spsr_el3 = asm ("mrs %[spsr_el3], spsr_el3"
        : [spsr_el3] "=r" (-> usize)
    );
    var far_el3 = asm ("mrs %[far_el3], far_el3"
        : [far_el3] "=r" (-> usize)
    );
    while (true) {
        asm volatile ("wfe");
    }
}
