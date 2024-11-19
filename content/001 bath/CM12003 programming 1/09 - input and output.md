#lecture
# 09 - input and output
class: [[CM12003]]
topics mentioned: #haskell #input #output
date: 2024-11-14
teacher: [[Willem Heijltj]]
## interaction with the real world
so far, we have viewed [[functional programming]] as a series of mathematical [[function]]s that take some inputs and produce an output. however, computer programs do something that mathematical functions do not: *interact with the real world*.
we call these [[side effects]].
## computational effects 
computational effects, or [[side effects]], are observable events that a function can do that aren't producing an output.
some effects include:
+ **I/O**
+ **randomness**
+ **data storage**
+ **exceptions**
+ **concurrency**
## basic I/O functions 
on the console, you can use:
```haskell
putStr s        -- prints s::String to stdout
putStrLn s      -- same, but starts a new line
writeFile f s   -- opens a file f::String and writes s::String to it

s <- getLine    -- reads s::String from stdin
s <- readFile f -- opens a file f::String and reads contents to s::String
```
### I/O expressions
an [[i/o expression]] such as `putStr` and `readFile` has two components:
1. a sequence of *i/o actions*, reading from or writing to the file system, generating a random number, stdio, etc.
2. a *return value*, such as the contents of the file, the user's input or a random value.
> [!WARNING] return values
> remember that everything in [[haskell]] is a [[function]]! this means that even expressions such as `putStr` that you wouldn't expect to return anything still do; it's just an empty tuple `()`. this is also what complete [[haskell]] programs will return when they complete!
## `do`-blocks and imperative programming
[[side effects]] are inherently imperative, that is they must occur in a definite order and at a specific point in time.
in [[haskell]], we enter a sort of *'imperative mode'* by using the `do` keyword:
```haskell
f = do
	line_1
	line_2
	...
	line_m
```
these lines are executed in order. each line is either:
+ an [[i/o expression|i/o expression]] whose return value is thrown away (`putStr "hello"`)
+ an [[i/o expression|i/o expression]] whose return value is bound to a variable (`x <- readFile "hello.txt"`)
+ a definition that binds an *non-i/o* expression to a variable (`let x = fibs !! 10`)
the `do`-block is **itself an [[i/o expression|i/o expression]]**! the `return` function is used to give the explicit return value of the expression, instead of an empty tuple `()`.
### recursion
since a `do`-block is itself a [[i/o expression|i/o expression]], we can call it from a `do`-block. we can even call it from itself!
here we can easily create a loop.
```haskell
loop = do
	line_1
	line_2
	...
	line_n
	loop
```
### conditional
to end a loop neatly, we use conditional expressions, such as `if-then-else`.
for example, the following program counts down from `n`:
```haskell
countdown n = do
	print n       -- short for: putStrLn (show n)
	if n == 0
	then do
		putStrLn "Liftoff!"
	else do
		countdown (n-1)
```
### building up return values 
we can take advantage of recursion in `do`-blocks to easily build up and concatenate multiple user inputs. here, we build up a list:
```haskell
getList = do
	putStr "who's on the list?"
	x <- getLine
	if x == "nobody"
	then return []
	else do
		putStrLn (x ++ " is on the list.")
		xs <- getList 
		return (x:xs)
```
## I/O types
so far, we have been doing a form of imperative programming. but how is this possible in [[haskell]]? what is the type of an [[i/o expression|i/o expression]]? let's take a look.
```haskell
putStr    :: String -> IO ()
putStrLn  :: String -> IO ()
writeFile :: String -> String -> IO ()
readFile  :: String -> IO String
return    :: a -> IO a
```
aha! it's type is `IO a`.
a type `IO a` represents:
+ a sequence of *IO actions*
+ followed by a *return value* of type `a`
in a `do`-block, the lines must have types:
```haskell
do_block :: IO a        -- Same as last line
do_block = do
	exprIO        -- :: IO b
	x <- exprIO   -- :: IO c then x :: c
	let x = expr  -- if expr :: d then x :: d
	return expr   -- :: IO a where expr :: a
```
### I/O types as I/O sequences
the type `IO a` is like `[a]` or `Maybe a`.
we can make the *empty* (base) i/o sequence with `return :: a -> IO a`
however, this implies we can also **concatenate** i/o sequences. for example `IO (IO a) -> IO a`