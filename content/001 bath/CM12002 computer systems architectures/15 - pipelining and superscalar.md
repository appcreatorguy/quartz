#lecture
# 15 - pipelining and superscalar
class: [[CM12002]]
topics mentioned: #pipelining #architecture 
date: 2024-11-28
teacher: [[Fabio Nemetz]]
## [[pipelining]] through [[instruction-level parallelism]]
the way we accomplish a more optimised [[fetch decode execute cycle|FDE]] cycle is through what is called [[instruction-level parallelism]]. this is done by having each stage of the cycle occur in parallel, for example as the next [[instruction]] is fetched, the previous one could be decoded, and the one before could be executed.
![[CM12002_W08_L01_P01_Pipelining_Superscalar.svg|600]]
this solution works great in practice, however, there are some pitfalls:
1. branches in code mean that the next instruction will not simply be the next location
	this is solved by generally trying to avoid branches, trying to predict the outcome of the branch instruction, or even [[pipelining]] multiple [[instruction]]s for every outcome.
2. instructions can conflict with each other, or depend on each other
	for example, a successive instruction can depend on the result of a previous one, meaning that the previous must be fully executed before the next one can be run.
3. load delays, where a stage such as the fetch stage can take longer than a decode or execute, causing the pipeline to stall
4. unequal stage times, similar to load delays, where stages do not take the same amount of time
## [[superscalar]] architecture
[[superscalar]] architecture is measured on two metrics, latency and throughput:
+ *latency* is the measure of the amount of time between the start of an action and its completion.
+ *throughput* is the total number of such actions in a given amount of time.
with [[pipelining]], we can improve the *throughput* of a processor by increasing the amount of instructions being processed per cycle. however the *latency* of the processor is constant, as the time taken to execute a single [[instruction]] **does not change**.

[[superscalar]] architectures use a form of [[instruction-level parallelism]] where instructions can be **executed in parallel** if the [[CPU]] deems them to be data independent. this maximises the use of *functional units* of the processor, such as an [[arithmetic logic unit|ALU]] or a bit [[shift register]]. [[pipelining]] and [[superscalar]] techniques are **not mutually exclusive**.