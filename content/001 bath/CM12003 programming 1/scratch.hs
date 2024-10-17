sumx :: Int -> Int -> [Int] -> Int
sumx _ s [] = s
sumx n s (x : xs)
    | n <= 0 = s
    | otherwise = sumx (n - 1) (s + x) xs

countUp :: Int -> [Int]
countUp n = n : countUp (n + 1)

plus :: (Num a) => a -> a -> a
plus x y = x + y

reverselist :: [a] -> [a]
reverselist [] = []
reverselist (x : xs) = reverselist xs ++ [x]

data MyFraction = MyFraction Integer Integer
  deriving (Read, Show, Eq, Ord)

myFraction :: Integer -> Integer -> MyFraction
myFraction n d = MyFraction (div n x) (div d x)
  where x = gcd n d

data Stack a = EmptyStack | StackNode a (Stack a)

push :: a -> Stack a -> Stack a
push = StackNode -- function reassignment

pop :: Stack a -> (Maybe a, Stack a)
pop EmptyStack = (Nothing, EmptyStack)
pop (StackNode x xs) = (Just x, xs)
