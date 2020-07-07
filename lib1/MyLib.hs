module MyLib (someFunc) where
import Data.Traversable

someFunc :: IO ()
someFunc = putStrLn (head ["someFunc"])
