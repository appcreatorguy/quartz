#lecture
# 07 - data storage
class: [[CM12004]]
topics mentioned: #data #binary 
date: 2024-10-24
teacher: [[Fabio Nemetz]]
## digital storage 
the basic element of digital storage is a [[bit]] (**b**[[binary|inary]] dig**it**)
a group of **8 bits** is called a *[[byte]]*, a group of **16 bits** is often called a *word*, and 32 or 64 bits are *long word*s.
## the store
to abstract physical representations of data storage, we use the concept of a *store*. the store consists of a collection of cells. to identify each cell, it is given an address, starting from 0 working up. this address is often represented in [[hexadecimal]] (i.e: a 256 cell store would have addresses from `0x00` to `0xFF`)
a *cell* is the smallest addressable unit of a store. commonly, a cell is 8 bits long, or a [[byte]] long.
### address space
an *[[address space]]* is a range of addresses that are associated with physical **or virtual** locations, such as cells in a store, or I/O ports, or even IP addresses.
when talking about data storage, a single address space can often refer to both secondary and primary storage, as well as input and output data locations (such as keyboard input, or text output for a screen).
the length of addresses determines the total size of the [[address space]]. [[computer architecture]]s are often referred to in terms of the length of their address space, for example 32 bit ($2^{32}$ positions = 4 GiB of memory) or 64 bit ($2^{64}$ = 16 EiB of memory)