#lecture
# 10 - instructions
class: [[CM12002]]
topics mentioned: #instructions #binary #data 
date: 2024-11-04
teacher: [[Fabio Nemetz]]

## instructions 
a [[von Neumann architecture]] computer operates by executing a series of [[instruction]]s (a program).

in a [[von Neumann architecture]], sequences of [[instruction]]s are stored in the data store as well as data.
any [[instruction]] needs a specification of:
+ the **operation** to be executed
+ the **operand**(s) upon which the operation is to be performed.
	+ typically *two*, such as an addition instruction, although some instructions may require only one operand, such as a jump or negate instruction, or *no* operands, such as a halt instruction.
## coding instructions
the design of instruction coding in architectures is to fit as much **expressive power** as possible in as **compact** a space as possible.
this means we want as few [[instruction]]s as possible, that are able to do as much as possible, while still being easy to decode and execute.
for example, take a `ADD` [[instruction]].
```
ADD 10,12
```
an operand is most naturally coded as an address in [[hexadecimal]] where the actual operand can be found. in this example, we're adding the data stored at location `0x10` to the address stored at location `0x12`.

in a 8 [[bit]]  word store, each cell can hold 256 unique bit patterns (`000`-`111`)
if a single [[byte]] is to hold an [[instruction]], we must imagine it must therefore hold at least one coded bit pattern representing an operation and up to two more representing the operands.
if we divide the byte as follows:

| Operation | Operand 1 | Operand 2 |
| --------- | --------- | --------- |
| 2 bits    | 3 bits    | 3 bits    |
but this just leaves us with *4 possible operations*!
thus, [[instruction]]s **occupy more than one [[byte]]** of storage.
they typically take a *variable* number of bytes. for example in x64, instructions take 2-4 bytes. however, some can go as far as 15 bytes!
typically, **2 bytes are used to hold the operation itself** (giving a theoretical maximum of 65,536 operations) and **2-4 bytes are used each to specify the addresses of operands**.
thus, our final *typical* instruction looks like this in memory:

| Operation | Operand 1 | Operand 2 |
| --------- | --------- | --------- |
| 2 bytes   | 2 bytes   | 2 bytes   |
## registers
like the data store, [[register]]s consist of arrays of bits. the [[arithmetic logic unit]] contains registers for holding the data while it is processed. they go under a variety of names, such as registers, or [[accumulator]]s. the control unit also has special registers to store program information.
the number of registers in the [[arithmetic logic unit]] determines how [[instruction]]s are defined.
for example, with *one register*, then only a single operand needs to be specified, as the other is implied to be the single register itself. this assumes the existence of two operations, a *load* to copy an operand from a store location into the register, and a *store* to copy from a register to a store location.

now we can define addition with a sequence of [[instruction]]s:
1. `LOAD` the content of the first location into the register
2. `ADD` the content of the second location.
3. `STORE` the result in another register.

if we have more than one [[register]], say 8, then we need *3 bits* in the instruction word to code it. 
![[CM12002_W05_L02_P02_Instructions(1).svg]]

some instructions have no arguments, such as $INC\ R_n$ or $HLT$.