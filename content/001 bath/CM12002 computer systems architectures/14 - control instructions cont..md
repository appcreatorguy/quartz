#lecture
# 14 - control instructions cont.
class: [[CM12002]]
topics mentioned: #instructions #architecture 
date: 2024-11-22
teacher: [[Fabio Nemetz]]
## the [[call stack]]
the [[call stack]] is used to help the [[CPU]] return to the right point after executing a [[subroutine]]. the [[stack]] is implemented using a block of successive memory locations (usually starting at a high point in the [[address space]]). a [[register]] called the *stack pointer* stores the address of the top of the stack, and this can then be loaded into the [[memory address register|MAR]] to return after completing a subroutine.