{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens
import Data.Aeson.Lens (key, _String)
import qualified Data.Text.IO as TIO
import Network.Wreq

url :: String
url = "https://api.chucknorris.io/jokes/random"

mainIO :: IO ()
mainIO = get url >>= \r -> TIO.putStrLn $ r ^. responseBody . key "value" . _String

mainIO' :: IO ()
mainIO' = do
  r <- get url
  let fact = r ^. responseBody . key "value" . _String
  TIO.putStrLn fact

main :: IO ()
-- main = do
  -- response <- get url
  -- let joke = response ^. responseBody . key "value" . _String
  -- TIO.putStrLn joke
main = mainIO
