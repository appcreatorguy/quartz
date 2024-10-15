#lecture 
# 04 - parallel architectures
class: [[CM12002]]
topics mentioned: #von_neumann #architecture 
date: 2024-10-11
teacher: [[Fabio Nemetz]]
## the [[von Neumann architecture|von Neumann]] bottleneck (memory wall)
the *memory wall* is the name given to the limiting factor that occurs when the speed at which the data and instructions can be retrieved from memory is too slow for the CPU to operate at speed.
> [!TLDR] 
> in other words, it occurs when **memory bus throughput is too slow for CPU speed**.
> because program memory and data memory are *shared*, this problem is exacerbated.

### solutions
the first obvious solution is to use alternative computer architecture|computer architectures]], such as the [[harvard architecture]]. however, there are other solutions, such as minimising the number of times the CPU has to access main memory. this is done in two major ways.
## caching
a [[cache]] is a data store that has much **higher access speeds** than RAM or main memory. it is used to *duplicate* information used most often by main memory.
### cache levels
[[cache]] is split up into different *levels*, that graduate in higher sizes and slower access speeds.
+ L1 cache
	+ closest to the processor, on the same die/chip
	+ extremely fast with smallest capacity
+ L2 cache
	+ just off-chip, slower than L1 cache, but faster than main memory 
	+ larger than L1 cache 
## registers
[[cpu register|registers]] are data stores on the directly on the CPU, and are used to store values that are **currently being used**. they are *extremely small*, but have the *highest speed* of any data store accessible to the CPU.

## parallelism and parallel architectures 
parallelism is the word given to the process of carrying out multiple operation *simultaneously*.

a basic [[von Neumann architecture]] processor is called a [[uniprocessor]]. however some computers have multiple [[arithmetic logic unit|ALUs]]. these are called [[multiprocessor]] systems. 