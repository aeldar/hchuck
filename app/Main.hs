{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.Wreq

url :: String
url = "https://api.chucknorris.io/jokes/random"

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  response <- get url
  print $ show response
