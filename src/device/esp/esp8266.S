
.section .text.runtime.getCurrentStackPointer
.global runtime.getCurrentStackPointer
runtime.getCurrentStackPointer:
    // The stack pointer is located in a1. Copy it over to the return register
    // in a2.
    mov a2, a1
    ret.n

.section .text.runtime.abort
.global runtime.abort
runtime.abort:
1:
    waiti 0 // wait for interrupt
    j 1b

.section .text.runtime.disableInterrupts
.global runtime.disableInterrupts
runtime.disableInterrupts:
    // Read the previous PS register state and disable all interrupts.
    rsil a2, 15
    ret.n

.section .text.runtime.restoreInterrupts
.global runtime.restoreInterrupts
runtime.restoreInterrupts:
    // Restore interrupts by writing back the previous PS register.
    wsr  a2, PS
    ret.n

.section .text.tinygo_scanCurrentStack
.global tinygo_scanCurrentStack
tinygo_scanCurrentStack:
    // TODO: save callee saved registers on the stack
    j tinygo_scanstack
