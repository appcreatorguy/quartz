

------------------------- Exercise 1

square :: Int -> Int
square x = x * x

pythagoras a b c = square a + square b == square c


------------------------- Exercise 2

factorial :: Int -> Int
factorial x
    | x <= 1    = 1
    | otherwise = x * factorial (x - 1)

power :: Int -> Int -> Int
power x y
    | y == 0    = 1
    | otherwise = x * power x (y - 1)
--note: you will need to create your own cases,
--      replacing the equals (=) sign with guards

euclid :: Int -> Int -> Int
euclid x y
    | y <= 0         = error "y must be greater than 0"
    | x <= 0         = error "x must be greater than 0"
    | x == y         = x
    | x > y          = euclid (x - y) y
    | otherwise      = euclid x (y - x)

------------------------- Exercise 3

pow :: Int -> Int -> Int
pow x y = if y == 0 then 1 else x * pow x (y - 1)


------------------------- Exercise 4

collatz :: Int -> Int
collatz x
    | x == 1    = 1
    | even x    = collatz(x `div` 2)
    | otherwise = collatz(3 * x + 1)

collatzCount :: Int -> Int -> Int
collatzCount x y
    | x == 1    = y
    | even x    = collatzCount(x `div` 2) (y + 1)
    | otherwise = collatzCount(3 * x + 1) (y + 1)

collatzMax :: Int -> (Int,Int) -> (Int,Int)
collatzMax n (m,s)
    | collatzCount n 0 > s = collatzMax (n - 1) (n, collatzCount n 0)
    | n == 1               = (m,s)
    | otherwise            = collatzMax (n - 1) (m,s)

------------------------- Exercise 5

ackermann :: Int -> Int -> Int
ackermann m n
    | m == 0    = n + 1
    | n == 0    = ackermann (m - 1) 1
    | otherwise = ackermann (m - 1) (ackermann m (n - 1))
