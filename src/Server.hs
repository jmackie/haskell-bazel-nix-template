{-# LANGUAGE OverloadedStrings #-}

-- Example borrowed from the haddock documentation for `wai`
-- http://hackage.haskell.org/package/wai

module Server
  ( main,
  )
where

import qualified Network.HTTP.Types as HTTP
import qualified Network.Wai as Wai
import qualified Network.Wai.Handler.Warp as Warp

main :: IO ()
main = do
  putStrLn "http://localhost:8080/"
  Warp.run 8080 app

app :: Wai.Application
app _request respond = do
  putStrLn "I've done some IO here"
  respond $
    Wai.responseLBS
      HTTP.status200
      [("Content-Type", "text/plain")]
      "Smashed it"
