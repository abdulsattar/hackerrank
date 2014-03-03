import Text.Printf

e2x x = printf "%.4f" . sum . take 10 $ map (term x) [0..]

term :: Double -> Int -> Double
term x 0 = 1
term x n = x ** n' / fn
 where
  n' = fromIntegral n
  fn = fromIntegral (f n)

f :: Int -> Int
f 1 = 1
f n = n * f (n -1)
