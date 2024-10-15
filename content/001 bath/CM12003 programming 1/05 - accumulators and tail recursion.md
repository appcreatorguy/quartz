#lecture 
# 05 - accumulators and tail recursion
class: [[CM12003]]
topics mentioned: #lists #complexity
date: 2024-10-14
teacher: [[Willem Heijltj]]
## complexity
the *[[time complexity]]* of a [[function]] is the number of *computation steps* that it takes **on average** to compute an input of a given size $n$.
for a given [[function]], we can write its [[time complexity]] in the form $O(n^2)$. this is called its *[[big-o notation]]*.

the *[[space complexity]]* of a function is the measure of the amount of [[computer memory]] that a computer uses while it is computing an input of a given size $n$. it is also written in [[big-o notation]].
## accumulators and tail [[recursion]]
compare the two [[function]]s:
```haskell
-- Recursive:
add [1,2,3,4,5] == 1 + add [2,3,4,5]
                == 1 + (2 + add [3,4,5]) ...
				== 1 + (2 + (3 + (4 + (5 + 0))))
				== 15
				
-- Tail recursive:
add [1,2,3,4,5] == addTo 0 [1,2,3,4,5]
				== addTo 1 [2,3,4,5]
				== addTo 3 [3,4,5] ...
				== addTo 15 []
				== 15
```

the first implementation of the `add` [[function]] runs recursively by calling itself and adding onto the previous result. however, this means that this previous result is not passed down the call stack, and so has to be held in memory, increasing [[space complexity]].
however, the second implementation runs recursively, calling an `addTo` function repeatedly, but it does this by **holding a list of previous results**. this means that the previous result *is* passed down the call stack, and so the compiler does not have to hold previous results separately in memory.
> [!tip]
> this allows the compiler to be more efficient, as it can optimise the [[function]] into a **while-loop**. 
> this list to hold onto previous outputs is called the *[[accumulator]]*.

