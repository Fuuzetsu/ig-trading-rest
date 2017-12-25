{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Price
  ( Price(..)
  ) where

import qualified Data.Aeson as Aeson
import           GHC.Generics (Generic)

-- | Price
data Price = Price
  { -- | Price
    ask :: !Double
    -- | Price
  , bid :: !Double
    -- | Last traded price. This will generally be null for non
    -- exchange-traded instruments
  , lastTraded :: !(Maybe Double)
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Price where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON Price where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
