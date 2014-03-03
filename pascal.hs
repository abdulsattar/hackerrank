-- Enter your code here. Read input from STDIN. Print output to STDOUT
import Data.List (intercalate)
pascal :: Int -> [Int]
pascal 1 = [1]
pascal 2 = [1,1]
pascal n = zipWith (+) (pn1 ++ [0]) (0:pn1)
 where
  pn1 = pascal (n - 1)

pascals n = intercalate "\n" [intercalate " " . map show $ pascal x | x <- [1..n]]

main = do
  n <- readLn :: IO Int
  putStrLn $ pascals n
