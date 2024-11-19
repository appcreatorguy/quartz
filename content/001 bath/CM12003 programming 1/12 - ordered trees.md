#lecture
# 12 - ordered trees
class: [[CM12003]]
topics mentioned: #trees #haskell 
date: 2024-11-13
teacher: [[Marina De Vos]]
## ordered [[tree]]s
a [[binary tree]] is a [[ordered tree]] if for every node, the left subtree has values *smaller* than it and the right subtree has values *larger* than it.
an [[in-order traversal]] of a tree will return the tree's values in order.
![[path25.svg|400]]
### finding the smallest element
```haskell
smallest :: Tree a -> a
smallest Empty            = error "smallest: empty tree given"
smallest (Node x Empty _) = x
smallest (Node _ left  _) = smallest left
```
here we're just plain returning the smallest element by finding the *left-most* element through [[pattern-matching]] alone, and without using comparison.
## balanced trees 
a tree is a [[balanced tree]] if the height difference between the subtrees is generally small. if a tree isn't balanced, it is called a [[skew tree]].
### self-balancing [[tree]]s
if we don't need to work with [[skew tree]]s, we can improve our worst-case complexity for building trees to *quasi-linear*. we do this with [[self-balancing trees]].
here we'll look at one example: *[[AVL trees]]*.
#### [[AVL trees]]
AVL trees operate on a **balance factor**. this is given by $$\text{height of left subtree} - \text{height of right subtree}$$
and is kept between $-1$ and $+1$ using **rotations**. this is where a node and its right child node are *swapped*, and the tree is recomputed, thus changing the height of the tree.
![[path442.svg|500]]
this uses a property similar to associativity: $x + (y+z)=(x+y)+z$.
> [!EXAMPLE] inserting into an AVL tree
> ![[path482.svg|500]]

an AVL tree has a worst case complexity of:
+ **insertion**: logarithmic $\mathcal{O}(\log{n})$
+ **tree-sort**: quasi-linear $\mathcal{O}(n\log{n})$