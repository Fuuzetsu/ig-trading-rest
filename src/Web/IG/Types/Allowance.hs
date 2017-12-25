{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Allowance
  ( Allowance(..)
  ) where

import qualified Data.Aeson as Aeson
import           GHC.Generics (Generic)

-- | Historical price data allowance
data Allowance = Allowance
  { -- | The number of seconds till the current allowance period will
    -- end and the remaining allowance field is reset
    allowanceExpiry :: !Int
    -- | The number of data points still available to fetch within the
    -- current allowance period
  , remainingAllowance :: !Int
    -- | The number of data points the API key and account combination
    -- is allowed to fetch in any given allowance period
  , totalAllowance :: !Int
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Allowance where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON Allowance where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
