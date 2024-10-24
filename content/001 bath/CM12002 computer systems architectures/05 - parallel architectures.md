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
+ each [[ALU|ALU]] has **its own [[control unit]]** (*task-level* parallelism)
+ each [[ALU|ALU]] has **its own data storage** (*data-level* parallelism)
## task level parallelism
when using task-level parallelism, there are two possible *control architectures* for [[multiprocessor]]s:
+ *multiple instruction streams*: each [[ALU|ALU]] has a separate [[control unit]].
+ *single instruction stream*: a single [[control unit]] issues the same instruction to multiple [[ALU]]s.
## data level parallelism 
independently of the *control architecture*, the [[ALU]]s may either operate on:
+ the **same *data stream***
+ a **different *control stream***
## Flynn's taxonomy
architectures can be grouped into 4 different types based on the combinations of task and data level parallelism they use.
![[g95.svg]]
### SISD: single instruction single data
this is a [[uniprocessor]] architecture, such as [[von Neumann architecture]] or [[harvard architecture]].
### SIMD: single instruction multiple data
