.cpu cortex-m4
.thumb

.word   0x20002000  /* stack top address */
.word   _start      /* 1  Reset */

.thumb_func
.global _start
_start:
    bl main
