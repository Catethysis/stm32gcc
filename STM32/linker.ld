MEMORY
{
    rom : ORIGIN = 0x08000000, LENGTH = 1M
    ram : ORIGIN = 0x20000000, LENGTH = 192K
}

SECTIONS
{
    .text : { *(.text*) } > rom
    .data : { *(.data*) } > rom
    .bss  : { *(.bss* ) } > ram
}