#lecture
# 02 - informed search
class: [[CM12001A]]
topics mentioned: #search
date: 2024-11-18
teacher:

## greedy search
in a [[greedy search]], we want to find the path from the start node to the goal node that has the lowest weight.
we do this by using a *heuristic function*, denoted as $h(n)$, that gives the weight of the best path to the goal node from node $n$. if we use this solely to evaluate our path, we have performed a greedy search.
## a* search
greedy searches may not be an optimal path. this is because it does not take into account the currently travelled distance. a more optimal algorithm is the [[a* search]], which adds on the currently travelled distance to the heuristic function $h(n)$. the new complete *evaluation function* is then $f(n)=g(n)+g(n)$, where $g(n)$ gives the distance from the initial node to $n$.
## properties of informed search algorithms
to work out the properties of an a* search, we have to look at the heuristic. 
a heuristic is *admissible*, if it **never overestimates** the cost to reach the goal state (i.e: straight line distance). with an admissible heuristic, a* will find the **optimal** solution. 
a heuristic is *consistent* if it satisfies a version of the **triangle inequality**.
$$h(n)\le c+h(n')$$
![[Pasted image 20241118124022.png|300]]
**all *consistent* heuristics are *admissible***. additionally, most admissible heuristics are consistent.
## local search
while a* is optimally efficient and has good [[time complexity]], it unfortunately has *exponential* [[space complexity]]. if we don't care about optimality, and just want to find a solution, we can take advantage of a [[local search]] algorithm.
### hill climbing
the most basic [[local search]] algorithm is a [[hill climbing]] search algorithm.
1. start at the initial node
2. take all possible neighbour nodes and take the one with the best value.
3. repeat step 2 until no neighbour has a better value.
the issue with this algorithm is that it can often get stuck on *local maxima*, which may not be the solution, as it may not be the *global maximum*.