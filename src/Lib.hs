{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( hello,
  )
where

import qualified Data.Text.IO as Text.IO

hello :: IO ()
hello = Text.IO.putStrLn "TODO"
