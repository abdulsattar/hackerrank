-- Enter your code here. Read input from STDIN. Print output to STDOUT
import Data.List.Split
import Control.Monad

main = do
  n <- readLn :: IO Int
  replicateM_ n processEachLine

processEachLine :: IO ()
processEachLine = do
  n:c:m:_ <- getLine >>= return . (map read) . (splitOn " ")
  putStrLn . show $ totalWrappers n c m

totalWrappers :: Int -> Int -> Int -> Int
totalWrappers n c m = bought + (exchange bought m)
  where bought = boughtWrappers n c

boughtWrappers :: Int -> Int -> Int
boughtWrappers n c = n `div` c

exchange :: Int -> Int -> Int
exchange wrappers amount
  | wrappers < amount  = 0
  | otherwise = 1 + exchange (wrappers - amount + 1) amount
