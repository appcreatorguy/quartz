#lecture
# 04 - adversarial search
class: [[CM12001A]]
topics mentioned: #search #adversarial
date: 2024-12-02
teacher: [[Ben Ralph]]

## adversarial search 
while a *non-adversarial* search involves a set of states with actions between them, and a goal state to reach, a *adversarial search* involves **players alternating moving between states**, and a *terminal test* to discover if the game is over, and who has won.
## utility functions
for an agent to decide which move is best in a game when using an adversarial search, we use *[[utility function]]s*. for an agent to know what the desired outcome of a game is, we assign values to final states based on their desiredness.
## minimax
assuming we are in a two-player zero-sum game, we can assume that one person is trying to maximise the [[utility function]], and the other is trying to minimise it. if we now assume that both players are *fully rational agents*, then every move they play will be optimal, and will maximise or minimise their score respectively. we can thus calculate this optimal move by **working backwards from the final state**.
it is common to represent games in the form of a search tree known as a [[minimax diagram]]. however, depending on the game the complexity of finding the value for every node in the tree is **exponential**.
![[Pasted image 20241202123851.png|500]]
### alpha-beta pruning
to solve this issue, we use a method called [[alpha-beta pruning]].
we give **upper and lower bounds** to the optimal score possible in this state by exploring the game tree, and use the bounds to find the branches that are not worth exploring (they wouldn't change the bounds).
we can then "prune" these branches to limit the number of nodes we need to explore.
## evaluation functions and table look-ups
sometimes, even with [[alpha-beta pruning]], minimax search is still not feasible.
we can thus use various techniques to reduce [[time complexity]] or [[space complexity]]. 
evaluation functions can help us give values to states without calculating an entire [[minimax diagram]]. for low [[space complexity]] games, we can save these solved positions in a table for reference.
