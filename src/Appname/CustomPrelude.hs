{-# language NoImplicitPrelude #-}

module {Appname}.CustomPrelude
  ( module X
  , module {Appname}.CustomPrelude
  ) where

import BasePrelude as X

import Control.Arrow as X (
    (>>>)
  , (<<<)
  )

import Control.Applicative as X
import Control.Monad as X
import Data.Function as X
import Data.Functor as X

import GHC.Show as X

import Safe as X (
    headMay
  , initMay
  , lastMay
  , tailMay
  )

applyN :: Int -> (a -> a) -> a -> a
applyN n f = X.foldr (.) id (X.replicate n f)
