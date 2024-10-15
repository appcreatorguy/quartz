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
