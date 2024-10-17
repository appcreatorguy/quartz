#logic #boolean 
### commutative laws
#### conjunction
$$(X \land Y) \equiv (Y \land X)$$
this means that conjunction can be computed in either direction.
#### disjunction
$$(X\lor Y) \equiv(Y\lor X)$$
again, disjunction can be computed in either direction.
### associative laws
#### conjunction
$$(X\land Y)\land Z \equiv X \land(Y\land Z)$$
#### disjunction
$$(X\lor Y) \lor Z\equiv X\lor(Y\lor Z)$$
conjunction and disjunction can be computed in any order.
### distributive laws
#### conjunction into disjunction
$$X \land (Y\lor Z)\equiv(X\land Y) \lor (X\land Z)$$
#### disjunction into conjunction
$$X\lor(Y\land Z) \equiv (X\lor Y) \land (X \lor Z)$$
conjunction and disjunction can be done into the other in brackets (à la multiplication into brackets).
### De Morgan's laws
for variables $X,Y,Z$ the following are identically true:
$$\lnot (X\land Y) \equiv \lnot X \lor \lnot Y$$
$$\lnot(X\lor Y) \equiv \lnot X \land \lnot Y$$
> *negation is distributive over a bracket as long as the connective inside is flipped*
### misc. laws
**double negation law**: $$\lnot\lnot X \equiv X$$
**implication law**:$$X \to Y \equiv \lnot X \lor Y$$
### equivalent formulae
from these laws it follows that any formula can be reduced to one with only these pairs of connectives:
+ $\lnot , \land$
+ $\lnot , \lor$
+ $\lnot , \to$