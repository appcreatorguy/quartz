#lecture
# 19 - using flip-flops
class: [[CM12002]]
topics mentioned: #logic
date: 2024-12-14
teacher: [[Fabio Nemetz]]

## [[register]]s
recall that a [[register]] is a digital circuit used in the CPU to store one or more bits of data. there are two types of register:
+ *parallel registers*: used to store data in use by the CPU
+ *shift registers*: used to implement the shift operation.
### [[parallel register]]
the [[parallel register]] is a memory store that can be written to or read *simultaneously*. it is used as a temporary store of data in the CPU.
>[!EXAMPLE] a simple 8-bit register
>here, we make a 8-bit [[parallel register]] out of [[D flip-flop]]s.
>we have a **clock** to synchronise the writing of data, and a **load** signal to enable or disable writing to the [[register]].
>![[Pasted image 20241214162039.png]]
### [[shift register]]
the [[shift register]] accepts/transfers information serially. thus, the input can be sent one by one along the input, and clocked through the register, emerging at the output one bit at a time. the clock signal synchronises the shifting of the bits, ensuring that the data is transferred accurately.
![[Pasted image 20241214163944.png]]
the shift register is used in the ALU for shift operations, where the input is loaded into the register, and then the register is clocked the number of times to shift by.
## counters
a counter is a [[register]] that can be incremented by 1. this makes it very useful for use as a [[program counter]].
after the maximum value is achieved, the next increment sets the counter to 0. a register of $n$ [[flip-flop]]s can count up to $2^n -1$. counters can be:
+ asynchronous (*ripple counter*)
+ synchronous
## [[ripple counter]]
a [[ripple counter]] gets it's name as the change to increment the counter starts at the lsb, and 'ripples' through the counter to the other end.
the counter is made up of *edge-triggered [[JK flip-flop]]s*. both inputs for the [[flip-flop]]s are **always kept high**, and the output of each flip-flop feeds into the clock of the next. thus, the when the clock is ticked, the outputs of the flip-flops toggle.
![[Pasted image 20241214165245.png]]![[Pasted image 20241214165247.png]]
the issue with this type of counter is that there is a *delay* for the counter to settle, as the changes have to ripple through the counter to increment it. this can lead to issues, as the delay may at some point become longer than the clock cycle, which can lead to an incorrect output of the counter when read. to solve this, we use synchronous counters.
## [[synchronous counter]]
a synchronous counter changes all the [[flip-flop]]s of the counter at the same time.
![[Pasted image 20241214165818.png]]
here, we use an `AND` gate to only toggle the msb if the previous two bits are both high (i.e: moving from $011$ to $100$).