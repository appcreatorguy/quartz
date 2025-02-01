#lecture
# 11 - instructions cont.
class: [[CM12002]]
topics mentioned: #instructions 
date: 2024-11-14
teacher: [[Fabio Nemetz]]
## two address codes
this is where we have our instruction word, and then two operands, each 16 bits, which can be either a [[register]] or a memory address. in this situation, an $ADD\ R_1 R_2$ command would look like:
![[CM12002_W05_L02_P02_Instructions(1) 1.svg]]

## handling [[instruction]] sequences
a *program* can be regarded as an **ordered sequence of instructions**.
if we lay these out *successively in memory*, we can carry them out by **stepping through the store locations in order**.
to do this, we add more special purpose [[register]]s to the [[control unit|CU]].
### [[program counter|program counter (PC)]]
this register holds the memory *address of the next instruction to be executed* and is incremented after each instruction execution to point to the next instruction in the sequence.
### [[instruction register|instruction register (IR)]]
this register holds *a copy of the current instruction* that is being executed.
## registers for accessing memory
the [[control unit|CU]] also has registers to allow it to access memory.
### [[memory address register|memory address register (MAR)]]
this register holds the memory *address that is currently being accessed*.
### [[memory data register|memory data register (MDR)]]
this holds the *contents that has been read from* (or will be written to) the location referenced in the [[memory address register|MAR]].
## the final model of our [[CPU]] with registers
![[CM12002_W05_L02_P02_Instructions(1) 2.svg]]
in our store, a program will be a sequence of instructions, composed of operations and operands.
## the [[fetch decode execute cycle|fetch, decode, execute cycle (FDE cycle)]]
say we have the following program loaded into our store:
```asmatmel
ldi r0,0x09 ; set R0 to 9
inc r0      ; increment R0
sts 0x15,r0 ; store R0 in address 21
```

| X   | Value            |
| --- | ---------------- |
| 0   | 1110000000001001 |
| 1   | 1001010000000011 |
| 2   | 1001001111100000 |
| 3   | 0000000000010101 |
| 4   |                  |
| 5   |                  |
| ... | ...              |
| 21  |                  |
to carry out an instruction:
+ it must first be *fetched* from the store to the control unit (the [[program counter|PC]] must also be incremented)
+ then it must be *interpreted* (or *decoded*) to determine what operation it is and how the operands are accessed
+ the operands must also be *fetched*
+ the operation must then be *executed*
the instruction cycle can then be split into two phases: the fetch phase, which is the same for all [[instruction]]s, and the execute phase, which may be different depending on what instruction is being executed.
### fetch stage
1. the contents of the [[program counter|PC]] are placed in the [[memory address register|MAR]], setting the store location of the next instruction.
2. the contents of the location whose address is in the [[memory address register|MAR]] is placed in the [[memory data register|MDR]].
3. the contents of the [[memory data register|MDR]] are placed in the [[instruction register|IR]], and the instruction is now ready for decoding.
4. the [[program counter|PC]] is incremented to point to the next instruction.
### execute stage 
this depends on the operation specified in the contents of the [[instruction register|IR]]. in this example, the instruction ` ldi r0,0x09 ; set R0 to 9` requires the control unit to fetch the next cell as an operand, in this case the value `0x09`, and load it into register `r0`. we do this as follows:
1. increment [[memory address register|MAR]]
2. contents of the location whose address is in [[memory address register|MAR]] is placed in the [[memory data register|MDR]]
3. contents of [[memory data register|MDR]] are placed in the specified [[register]].