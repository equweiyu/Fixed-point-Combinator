newtype Mu a = Mu (Mu a->a)
y :: (a -> a) -> a
y f = (\h -> h $ Mu h) (\x -> f . (\(Mu g) -> g) x $ x)

fact :: Int -> Int
fact = y $ \fact -> \n -> case n of 
  1 -> 1
  n -> n * fact (n-1)