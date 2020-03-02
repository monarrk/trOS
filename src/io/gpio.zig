const io = @import("../io.zig");
const types = @import("../types.zig");

const mmio = io.mmio;

const Register = types.regs.Register;

pub var GPFSEL0: u32 = (mmio.MMIO_BASE + 0x00200000);
pub var GPFSEL1 = Register{ .ReadWrite = mmio.MMIO_BASE + 0x00200004 };
pub var GPFSEL2: u32 = (mmio.MMIO_BASE + 0x00200008);
pub var GPFSEL3: u32 = (mmio.MMIO_BASE + 0x0020000C);
pub var GPFSEL4: u32 = (mmio.MMIO_BASE + 0x00200010);
pub var GPFSEL5: u32 = (mmio.MMIO_BASE + 0x00200014);
pub var GPSET0: u32 = (mmio.MMIO_BASE + 0x0020001C);
pub var GPSET1: u32 = (mmio.MMIO_BASE + 0x00200020);
pub var GPCLR0: u32 = (mmio.MMIO_BASE + 0x00200028);
pub var GPLEV0: u32 = (mmio.MMIO_BASE + 0x00200034);
pub var GPLEV1: u32 = (mmio.MMIO_BASE + 0x00200038);
pub var GPEDS0: u32 = (mmio.MMIO_BASE + 0x00200040);
pub var GPEDS1: u32 = (mmio.MMIO_BASE + 0x00200044);
pub var GPHEN0: u32 = (mmio.MMIO_BASE + 0x00200064);
pub var GPHEN1: u32 = (mmio.MMIO_BASE + 0x00200068);
pub var GPPUD = Register{ .WriteOnly = mmio.MMIO_BASE + 0x00200094 };
pub var GPPUDCLK0 = Register{ .WriteOnly = mmio.MMIO_BASE + 0x00200098 };
pub var GPPUDCLK1: u32 = (mmio.MMIO_BASE + 0x0020009C);
