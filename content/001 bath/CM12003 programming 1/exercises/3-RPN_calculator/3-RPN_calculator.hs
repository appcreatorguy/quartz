import Text.Read (readMaybe)

------------------------- RPN Calculator

run :: String -> Int
run x = eval (map operation (words x)) []

data Operation x = Add | Multiply | Negate | Value Int | Duplicate | Kill | Second | Third

operation :: String -> Operation x
operation x
  | x == "+" = Add
  | x == "*" = Multiply
  | x == "-" = Negate
  | x == "d" = Duplicate
  | x == "k" = Kill
  | x == "s" = Second
  | x == "t" = Third
  | otherwise = Value (integer x)

integer :: String -> Int
integer x = case readMaybe x :: Maybe Int of
  Just a -> a
  Nothing -> error "Parse Error"

eval :: [Operation x] -> [Int] -> Int
eval (Value x:os) is = eval os (x:is)
eval (Negate:os) (a:bs) = eval os ((-a):bs)
eval (Duplicate:os) (a:bs) = eval os (a:a:bs)
eval (Kill:os) (a:bs) = eval os bs
eval (Third:os) (a:b:c:ds) = eval os (c:a:b:ds)
eval (o:os) (a:b:cs) = case o of
  Add -> eval os ((a+b):cs)
  Multiply -> eval os ((a*b):cs)
  Second -> eval os (b:a:cs)
eval [] (a:_) = a
eval (_:_) [x] = error "Type error"
