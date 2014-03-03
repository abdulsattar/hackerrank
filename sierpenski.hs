import Data.List(intercalate)
sp c n = intercalate "" $ [replicate nus '_'] ++ [replicate n1s '1'] ++ [replicate nus '_']
 where
  n1s = 2 * n - 1
  nus = (c - n1s) `div` 2

spn r c = [sp c n | n <- [1..r]]

serp 0 r c = spn r c
serp g r c = upper ++ lower
 where
  mid = r `div` 2
  ps = serp (g-1) mid (c `div` 2)
  nus = (c - 2 * (mid-1)) `div` 2
  us = replicate mid $ replicate nus '_'
  upper = zipWith (++) (zipWith (++) us ps) us
  leftLower = ps
  rightLower = ps
  lower = zipWith (\l r -> l ++ "_" ++ r) leftLower rightLower

main = do
  g <- readLn :: IO Int
  putStrLn $ intercalate "\n" $ serp g 32 63
