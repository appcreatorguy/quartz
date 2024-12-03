#lecture
# 12 - control instructions
class: [[CM12002]]
topics mentioned: #instructions #architecture 
date: 2024-11-21
teacher: [[Fabio Nemetz]]
## control instructions 
these instructions can alter the content of the [[program counter]], such as a jump or branch instruction or a subroutine.
this is required as computers are **not completely sequential**, and will always require some form of decision making.
the most common control instructions found in instruction sets are:
+ jump/branch (`JMP`/`BRA`)
	+ conditional (`BRP`/`BRZ`/`BRE`)
	+ unconditional (`JMP`)
+ subroutines (procedure calls)
### conditional and unconditional branches
a branch/jump instruction has as one of its operands the address of the next instruction to be executed.
most often the instruction is a *[[conditional branch]]*. that is, the branch is executed (the address is loaded into the program counter) if a certain condition is met. otherwise, the next instruction in the sequence is executed.
some examples of [[conditional branch]]es are:
+ `BRZ`: *branch if zero*
+ `BRE`: *branch if equal*
a branch instruction in which the branch **is always taken** is called an *unconditional* branch.
### subroutines
repeated tasks may be implemented in a more structured way. we do this through the use of [[subroutines]] or *procedures*.
a block of instructions is placed in memory and the starting location is designated. the subroutine can then be *called* by branching to this designated starting location. when the block is completed, the subroutine returns to the point at which it was called. for the CPU to know where it needs to return to, a [[stack]] is used.
