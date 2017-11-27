{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.AccountInfo
  ( AccountInfo(..)
  ) where

import qualified Data.Aeson as Aeson
import           GHC.Generics (Generic)

-- | Account financial data
data AccountInfo = AccountInfo
  { -- | Account funds available for trading amount
    available :: !Double
    -- | Balance of funds in the account
  , balance :: !Double
    -- |Minimum deposit amount required for margins
  , deposit :: !Double
    -- |Account profit and loss amount
  , profitLoss :: !Double
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON AccountInfo where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
