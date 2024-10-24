#von_neumann #architecture 
nearly all CPUs today follow a single [[computer architecture|architecture]], proposed by John von Neumann.
it is called the [[von Neumann architecture]].
it **abstracts** the particular details of machines, while at the same time defining them with a *common structure*, split into different **units**.
the [[von Neumann architecture]] is an example of a [[uniprocessor]] architecture.
### the ALU
the [[ALU|arithmetic logic unit (ALU)]] is where **computational operations are carried out.** the unit requires *input data*, as well as *control signals* about which operation to carry out.
### the CU
the [[control unit|control unit (CU)]] exists to manage the processes in the CPU. 
it:
+ determines the operation to be performed.
+ selects the operand to be used
+ sends the corresponding *control signal* to the [[ALU|ALU]].
+ determines the **next** operation to be performed.
## instructions are data
the main idea of the [[von Neumann architecture]] is that code is manipulated as data; they are both stored in the same memory.