import Distribution.Fields.LexerMonad (LexState(LexState))



------------------------- Exercise 1

add :: [Int] -> Int
add []     = 0
add (x:xs) = x + add xs

times :: [Int] -> Int
times [] = 1
times (x:xs) = x * times xs

range :: Int -> Int -> [Int]
range s e
  | e<=s = [e]
  | otherwise = s : range (s+1) e


factorial :: Int -> Int
factorial x
  | x < 1 = error "factorial: input cannot be less than one"
  | otherwise = times (range 1 x)


------------------------- Exercise 2

count :: [a] -> Int
count []     = 0
count (_:xs) = 1 + count xs

append :: [a] -> [a] -> [a]
append xs [] = xs
append [] ys = ys
append (x:xs) ys = x : append xs ys

concatenate :: [[a]] -> [a]
concatenate [] = []
concatenate (x:y:xs) = append x y ++ concatenate xs


------------------------- Exercise 3

member :: Int -> [Int] -> Bool
member _ [] = False
member a (x:xs)
  | a == x = True
  | otherwise = member a xs

member2 _ [] = False
member2 a (x:xs) = a == x || member2 a xs

remove a [] = []
remove a (x:xs)
  | a == x = remove a xs
  | otherwise = x : remove a xs

at :: [a] -> Int -> a
at [] i = error "index too large for this list"
at (x:xs) i
  | i == 0 = x
  | i < 0 = error "index is negative"
  | otherwise = at xs (i-1)


------------------------- Exercise 4

final :: [a] -> a
final [x] = x
final [] = error "list was empty"
final (x:xs) = final xs

ordered :: [Int] -> Bool
ordered [] = True
ordered [x] = True
ordered (x:y:zs) = x <= y && ordered (y : zs)

pair :: [a] -> [b] -> [(a,b)]
pair [] _ = []
pair _ [] = []
pair (a:as) (b:bs) = (a,b) : pair as bs

find :: Int -> [(Int,String)] -> String
find _ [] = ""
find i ((a,b):xs)
  | i == a = b
  | otherwise = find i xs


------------------------- Exercise 5


------------------------- Exercise 6

merge [] b = b
merge a [] = a
merge (a:as) (b:bs)
 | a <= b = a : merge as (b:bs)
 | otherwise = b : merge (a:as) bs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort x = merge (msort (take half x)) (msort (drop half x)) where half = length x `div` 2

------------------------- Exercise 7

type Hanoi = ([Int],[Int],[Int])

hanoi :: Int -> [Hanoi]
hanoi = undefined
