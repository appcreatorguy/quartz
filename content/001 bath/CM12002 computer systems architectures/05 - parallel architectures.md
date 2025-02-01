#lecture
# 05 - parallel architectures
class: [[CM12002]]
topics mentioned: #architecture
date: 2024-10-24
teacher: [[Fabio Nemetz]]
## recap
> from [[04 - parallel architectures|lecture 4]]:
![[04 - parallel architectures#parallelism and parallel architectures]]

[[multiprocessor]] systems are (potentially) fast, but harder to control, and so therefore there are many kinds of parallel architecture, depending on whether:
+ each [[arithmetic logic unit|arithmetic logic unit]] has **its own [[control unit]]** (*task-level* parallelism)
+ each [[arithmetic logic unit|arithmetic logic unit]] has **its own data storage** (*data-level* parallelism)
## task level parallelism
when using task-level parallelism, there are two possible *control architectures* for [[multiprocessor]]s:
+ *multiple instruction streams*: each [[arithmetic logic unit|arithmetic logic unit]] has a separate [[control unit]].
+ *single instruction stream*: a single [[control unit]] issues the same instruction to multiple [[arithmetic logic unit]]s.
## data level parallelism 
independently of the *control architecture*, the [[arithmetic logic unit]]s may either operate on:
+ the **same *data stream***
+ a **different *control stream***
## Flynn's taxonomy
architectures can be grouped into 4 different types based on the combinations of task and data level parallelism they use.
![[g95.svg]]
### SISD: single instruction single data
this is a [[uniprocessor]] architecture, such as the [[von Neumann architecture]] or [[harvard architecture]].
### SIMD: single instruction multiple data
this involves the application of a basic instruction to a **large dataset**, such as **vectors and matrices**.
typical applications involve [[GPU]]s, such as those in games consoles, as these have to do a large amount of vector and matrix operations.
### MISD: multiple instruction single data
this involves running multiple different operations on the same data. it is highly specialised, and not used too often. for example, it is often used in **safety-critical operations**, such as running calculations multiple times on the same inputs on the space shuttle flight control computers.
### MIMD: multiple instruction multiple data
this involves multiple processors functioning asynchronously, and independently from each other. modern multi-core processors are all MIMD. a [[multi-core processor]] is a type of [[multiprocessor]] where all processors are on the same die chip.
## memory architectures
there are two possible memory architectures
### shared memory
each processor has access to a common memory space that is shared between all processors.
sharing is efficient use of memory space, but:
+ it can introduce [[bottleneck]]s from the memory to the [[CPU]].
+ [[cache coherence]] becomes a problem, where data in a processors cache is modified, and must be updated in memory to be used by other processors.
because of these issues, shared memory architectures do not scale to well.
### distributed memory
each processor has its own data store or memory space. processors have to request data from other memory stores to gain access to it.

this architecture is straightforward to scale up, however, coordination and coordination between processors is indirect, messages must be passed between processors to allow data to be shared between them.

for a distributed memory system to work efficiently, data and tasks must be split up and distributed before computation and then reassembled afterwards, a non-trivial task.

## shared memory MIMD
shared memory MIMD is becoming the dominant architecture in general purpose computing, as there are diminishing returns on building faster [[uniprocessor]]s.
[[multi-core processor]]s are now standard. operating systems now take advantage of these multiple cores by allowing for multitasking, using multiple programs at once, as well as allowing for parallel tasks to be completed.
## limits of parallelisation and Amdahl's Law
typically, there is a *limit* to how much a process can be parallelised. some tasks may require the output of a previous task, and so the two cannot be undertaken in parallel.

these limits are described by *"Amdahl's Law"* (from 1967).
> for a given computational task, suppose a proportion $0\le p\le 1$ can be parallelised, but a proportion $s=1-p$ is inherently sequential, and cannot be parallelised.
> then, the theoretical speedup of the execution of the whole task if it is parallelised is given by $$\frac{1}{(1-p)+\frac{p}{N}}$$ where $N$ is the number of parallel processors.
![[AmdahlsLaw.svg]]