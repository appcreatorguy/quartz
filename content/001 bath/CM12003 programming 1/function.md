#functions 
a [[function]] in the context of [[functional programming]] is a self-contained block of code that takes in input, called arguments or parameters, and produces an output without modifying the state of the program.
functions can have [[side effects]], for example:
+ reading (and writing) to/from *memory*
+ reading (and writing) to/from *the user*
+ using *randomness*

> [!IMPORTANT]
> + a programming function is *pure* if it has no side-effects.
> + a programming function is *referentially transparent* if its output is fully determined by it's inputs (alike to a *mathematical* function)