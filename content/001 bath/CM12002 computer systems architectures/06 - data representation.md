#lecture
# 06 - data representation
class: [[CM12002]]
topics mentioned: #data #binary #hexadecimal
date: 2024-10-18
teacher: [[Fabio Nemetz]]
## data representation 
computers need to represent a variety of data:
+ unsigned **integers**
+ *signed* **integers** 
+ alphanumeric **characters** and **strings**
+ **real numbers**
+ **instructions**
+ memory **addresses**
## two-state representation
almost **all** computers are based on a *two-state* system, that is a the computer can only distinguish between two states electrically, such as high voltage or low voltage, or a transistor being on or off.
this can be mapped easily to a common numbering system:*[[binary]]*
## numeration systems
all numeration systems are *representational*, that is they use symbols to represent values. for example, for the roman numeral system:

| Symbol | Value |
| ------ | ----- |
| I      | 1     |
| V      | 5     |
| X      | 10    |
| L      | 50    |
| C      | 100   |
| D      | 500   |
| M      | 1000  |
we commonly use the **decimal** numeral system, with symbols `0 1 2 3 4 5 6 7 8 9`.
this is also called *base 10*, as there are 10 symbols that a single place value can hold. this also means that place values will go up in powers of 10, for example $10^0,10^1,10^2,10^3,\ldots$  ******

however, there are other systems than decimal. if for example we use only 8 symbols (`0 1 2 3 4 5 6 7`), our new base would be *8*, and our place values would go up in powers of 8 ($8^0,8^1,8^2,8^3,\ldots$). this is called the **octal** system.

now, if we use only 2 symbols (`0 1`), our new base would be *2*, and our place values would go up in powers of 2 ($2^0,2^1,2^2,2^3,\ldots$). this is the **[[binary]]** system.
>[!EXAMPLE]
>$134_8$ means $134$ in base *8* or **octal**
>$134_8 = 1\times 8^2+3\times 8^1+4\times8^0=64+24+4=92$
>
>$1101_2$ means $1101$ in **[[binary]]**
>$1101_2=1\times 2^3+1\times2^2+0\times2_1+1\times2^0=8+4+0+1=13$

we can also have bases higher than 10. to do this, we start using the alphabet, starting from $A$. for example, a common base higher than 10 is **[[hexadecimal]]**, where $A=10,B=11,C=12,\ldots,F=15$.
## the binary system 
> a ==b==inary dig==it== is called a *[[bit]]*

we often use bits when we are talking about binary in relation to computers. bits are also the base unit for how we measure computer storage. 8 bits are called a *[[byte]]*, and working backwards, 4 bits are called a *nibble*, (to carry on the joke :3).
higher units are then built metrically on top of the byte (kilobyte, megabyte, gigabyte,...).

when we talk about [[computer memory]] instead of computer storage however, it can often be more useful to continue measuring in powers of 2, so we instead use alternative names for these measurements (kibibyte $2^{10}$, mebibyte $2^{20}$, gibibyte $2^{30}$,...)