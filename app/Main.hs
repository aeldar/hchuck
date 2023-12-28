{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.HTTP.Simple

endpoint :: Request
endpoint = "https://api.chucknorris.io/jokes/random"

main :: IO ()
main = do
  response <- httpJSON endpoint
  putStrLn $ getResponseBody response

