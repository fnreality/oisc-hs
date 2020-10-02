import Control.Monad

import Data.List
import Data.Char

import System.Environment
import System.IO

(.>) :: (a -> b) -> (b -> c) -> (a -> c)

(.>) x y = y . x

main :: IO ()

main = getArgs >>= mapM_ (readFile >=> processFile)

processFile :: String -> IO ()

processFile = processFileLines .> map putStrLn

processFileLines :: String -> [String]

processFileLines =
  lines .> filter (/="") .> foldl processLine []

processLine :: 
