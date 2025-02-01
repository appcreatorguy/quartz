#lecture
# 19 - sequential logic
class: [[CM12002]]
topics mentioned: #logic
date: 2024-12-12
teacher: [[Fabio Nemetz]]
## SR latch (set-reset latch)
a simple SR latch can be implemented with NOR gates:
![[Pasted image 20241212165450.png|500]]
it has 2 inputs: **`S`** (set) and **`R`** (reset), and 2 outputs: `Q`, and `Q'` (complement of `Q`).
the circuit is *bistable*, that is the system holds constant outputs in **two states**. the first is when `Q=0, Q'=1`. the second stable position is when `Q=1, Q'=0`. to flip between these two states, either the set or the reset bit is brought high. the set flips to the second state (where `Q=1`) and the reset flips to the first state (where `Q'=1`).
>[!ERROR] chaos
> if you try to bring both `S=1, R=1`, the NOR gates will try to bring both `Q, Q'` low, which is impossible, as `Q'` is supposed to be the complement of `Q`. in reality, this would lead to chaotic outputs from both gates, where they might settle back into a stable state at some point.

the SR latch is called *locked* or *asynchronous*, as there is a delay before the system responds to an input, as both gates cannot switch simultaneously.
to solve this issue, as well as chaotic state transitions, we introduce clocks to the simple SR latch. these are called [[flip-flop]]s.
## flip-flops
### SR flip-flop
the simple SR latch can be extended with some control logic to only respond to inputs when the clock signal (`CLK`) is **high**.
![[Pasted image 20241212170210.png]]
the R and S inputs are only passed to the latch during the raised state of the clock pulse.
## D-type flip-flop
one problem with SR latches is that the chaotic state `R=1, S=1` must be avoided. one way that this can be done is by ensuring that both inputs are **always different** by **adding a NOT gate**. this is called a *D-type flip-flop*, or a [[D flip-flop]].
![[Pasted image 20241212170348.png]]
this useful, because when combined with the clock being required to change the latch, we can now easily store data, by passing it to D, and raising the clock. the input is then held until the clock is pulsed high again. this is why the gate is sometimes called a *delay flip-flop*, as it delays the input for a single clock pulse.
### J-K flip-flop
this flip-flop is similar to clocked S-R flip flop, but makes use of the restricted combination (`1,1`) as a **toggle** to flip the output of the flip flop. 
![[Pasted image 20241214161103.png|500]]
