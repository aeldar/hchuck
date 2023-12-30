{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens
import Data.Aeson.Lens (key, _String)
import qualified Data.Text.IO as TIO
import Network.Wreq

url :: String
url = "https://api.chucknorris.io/jokes/random"

f :: IO ()
f = get url >>= \r -> TIO.putStrLn $ r ^. responseBody . key "value" . _String

main :: IO ()
-- main = do
  -- response <- get url
  -- let joke = response ^. responseBody . key "value" . _String
  -- TIO.putStrLn joke
main = f
